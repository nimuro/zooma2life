<?php
if (!defined('_GNUBOARD_')) exit; // 개별 페이지 접근 불가

// 밑의 return; 코드의 주석을 해제하면 사용 안함
//return;

add_event('tail_sub', 'youtube_content_embed_fn_script', 0, 0);

function youtube_content_embed_fn_script(){
?>
<script>
jQuery(function($){

var youtube_content_embed = {
    createYoutubeEmbed : function(str, key) {
        
        if( ! str ) return str;

        var is_html = /<\/?[a-z][\s\S]*>/i.test(str),
            $html = jQuery("<div/>").html(str),
            $iframe = jQuery("<iframe/>", { "src":"https://www.youtube.com/embed/"+key });

        if( ! $html.find($iframe).length ){
            return str+'<div><iframe class="youtube_iframe" width="320" height="240" src="https://www.youtube.com/embed/' + key + '" frameborder="0" allowfullscreen></iframe></div>';
        }
        return str;
    },
    transformYoutubeLinks : function(text, selector) {
        if (!text) return text;
        var self = this;

        var linkreg = /(?:)<a([^>]+)>(.+?)<\/a>/g,
            fullreg = /(https?:\/\/)?(www\.)?(youtube\.com\/watch\?v=|youtu\.be\/)([^& \n<]+)(?:[^ \n<]+)?/g,
            regex = /(?:https?:\/\/)?(?:www\.)?(?:youtube\.com\/watch\?v=|youtu\.be\/)([^& \n<]+)(?:[^ \n<]+)?/g,
            resultHtml = String(text),
            match = text.match(fullreg),
            el_html = jQuery("<div/>").html(text),
            keys = [];

        if (match && match.length > 0) {

            var matchlinks = text.match(linkreg);

            if (matchlinks && matchlinks.length > 0) {
                for (var i=0; i < matchlinks.length; i++) {
                    var matchParts = matchlinks[i].split(regex),
                        match_key = matchParts[1] ? matchParts[1].replace(/[&\/\\#,+()$~%.'":*?<>{}]/g, '') : '';

                    if( match_key && keys.indexOf(match_key) === -1 ){
                        keys.push( match_key );
                        resultHtml = resultHtml.replace(matchlinks[i], self.createYoutubeEmbed(matchlinks[i], match_key) );
                    }
                }
            }
            
            for (var i=0; i < match.length; i++) {
                var matchParts = match[i].split(regex),
                    match_key = matchParts[1] ? matchParts[1].replace(/[&\/\\#,+()$~%.'":*?<>{}]/g, '') : '';
                    
                    if( match_key && ! $(el_html).find("a:contains('"+match[i]+"')").length ){
                        if( keys.indexOf(match_key) === -1 ){
                            keys.push( match_key );
                            resultHtml = resultHtml.replace(match[i], self.createYoutubeEmbed(match[i], match_key) );
                        }
                    }
            }
        }
        return resultHtml;
    }
}

function recursiveEach_replace_youtubelink($element){

    var $currentElement = $element;

    if( ! $currentElement.children().not("BR").length ){

        var $othis_text = $currentElement.text();

        if( $othis_text ){
            var $ori_html = $currentElement.clone(true, true),
                convert_html = youtube_content_embed.transformYoutubeLinks($ori_html[0].outerHTML);

            if( $ori_html[0] !== convert_html ){
                $currentElement.replaceWith( convert_html );
            }
        }
    } else {
        $element.children().not("BR").each(function () {
            var $child_Element = $(this);

            recursiveEach_replace_youtubelink($child_Element);
        });
    }
}

function youtube_content_replace(selector, i){

    var cm = (typeof selector !== 'undefined') ? selector : "";

    if( cm && jQuery(cm).length ){
        recursiveEach_replace_youtubelink(jQuery(cm));
        $(window).resize(function(){resizeYoutube('.youtube_iframe');});
        $(function(){resizeYoutube('.youtube_iframe');});
    }
}

//iframe 리사이즈 -반응형
function resizeYoutube(name){
    $(name).each(function(){ if( /^https?:\/\/www.youtube.com\/embed\//g.test($(this).attr("src")) ){ $(this).css("width","100%"); $(this).css("height",Math.ceil( parseInt($(this).css("width")) * 480 / 854 ) + "px");} });
}

youtube_content_replace("#bo_v_con");   // 글 본문
youtube_content_replace(".cmt_contents");   // 코멘트들

});
</script>
<?php
}   //end php function
?>