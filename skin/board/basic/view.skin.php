<?php
if (!defined("_GNUBOARD_")) exit; // 개별 페이지 접근 불가
include_once(G5_LIB_PATH.'/thumbnail.lib.php');

// add_stylesheet('css 구문', 출력순서); 숫자가 작을 수록 먼저 출력됨
add_stylesheet('<link rel="stylesheet" href="'.$board_skin_url.'/style.css">', 0);
//add_stylesheet('<link rel="stylesheet" href="'../../../css/mobile_shop.css">', 0);
?>

<script src="<?php echo G5_JS_URL; ?>/viewimageresize.js"></script>

<!-- 게시물 읽기 시작 { -->

<article id="bo_v" style="width:<?php echo $width; ?>">
    <header>
        <h2 id="bo_v_title">
            <?php if ($category_name) { ?>
            <span class="bo_v_cate"><?php echo $view['ca_name']; // 분류 출력 끝 ?></span> 
            <?php } ?>
            <span class="bo_v_tit">
            <?php
            echo cut_str(get_text($view['wr_subject']), 70); // 글제목 출력
            ?></span>
        </h2>
    </header>

    <section id="bo_v_info">
        <h2>페이지 정보</h2>
        <div class="profile_info">
        	<div class="pf_img"><?php echo get_member_profile_img($view['mb_id']) ?></div>
        	<div class="profile_info_ct">
        		<span class="sound_only">작성자</span> <strong><?php echo $view['name'] ?><?php if ($is_ip_view) { echo "&nbsp;($ip)"; } ?></strong><br>
       		 	<span class="sound_only">댓글</span><strong><a href="#bo_vc"> <i class="fa fa-commenting-o" aria-hidden="true"></i> <?php echo number_format($view['wr_comment']) ?>건</a></strong>
        		<span class="sound_only">조회</span><strong><i class="fa fa-eye" aria-hidden="true"></i> <?php echo number_format($view['wr_hit']) ?>회</strong>
        		<strong class="if_date"><span class="sound_only">작성일</span><i class="fa fa-clock-o" aria-hidden="true"></i> <?php echo date("y-m-d H:i", strtotime($view['wr_datetime'])) ?></strong>
    		</div>
    	</div>

    	<!-- 게시물 상단 버튼 시작 { -->
	    <div id="bo_v_top">
	        <?php ob_start(); ?>

	        <ul class="btn_bo_user bo_v_com">
				<li><a href="<?php echo $list_href ?>" class="btn_b01 btn" title="목록"><i class="fa fa-list" aria-hidden="true"></i><span class="sound_only">목록</span></a></li>
	            <?php if ($reply_href) { ?><li><a href="<?php echo $reply_href ?>" class="btn_b01 btn" title="답변"><i class="fa fa-reply" aria-hidden="true"></i><span class="sound_only">답변</span></a></li><?php } ?>
	            <?php if ($write_href) { ?><li><a href="<?php echo $write_href ?>" class="btn_b01 btn" title="글쓰기"><i class="fa fa-pencil" aria-hidden="true"></i><span class="sound_only">글쓰기</span></a></li><?php } ?>
	        	<?php if($update_href || $delete_href || $copy_href || $move_href || $search_href) { ?>
	        	<li>
	        		<button type="button" class="btn_more_opt is_view_btn btn_b01 btn"><i class="fa fa-ellipsis-v" aria-hidden="true"></i><span class="sound_only">게시판 리스트 옵션</span></button>
		        	<ul class="more_opt is_view_btn"> 
			            <?php if ($update_href) { ?><li><a href="<?php echo $update_href ?>">수정<i class="fa fa-pencil-square-o" aria-hidden="true"></i></a></li><?php } ?>
			            <?php if ($delete_href) { ?><li><a href="<?php echo $delete_href ?>" onclick="del(this.href); return false;">삭제<i class="fa fa-trash-o" aria-hidden="true"></i></a></li><?php } ?>
			            <?php if ($copy_href) { ?><li><a href="<?php echo $copy_href ?>" onclick="board_move(this.href); return false;">복사<i class="fa fa-files-o" aria-hidden="true"></i></a></li><?php } ?>
			            <?php if ($move_href) { ?><li><a href="<?php echo $move_href ?>" onclick="board_move(this.href); return false;">이동<i class="fa fa-arrows" aria-hidden="true"></i></a></li><?php } ?>
			            <?php if ($search_href) { ?><li><a href="<?php echo $search_href ?>">검색<i class="fa fa-search" aria-hidden="true"></i></a></li><?php } ?>
			        </ul> 
	        	</li>
	        	<?php } ?>
	        </ul>
	        <script>

            jQuery(function($){
                // 게시판 보기 버튼 옵션
				$(".btn_more_opt.is_view_btn").on("click", function(e) {
                    e.stopPropagation();
				    $(".more_opt.is_view_btn").toggle();
				})
;
                $(document).on("click", function (e) {
                    if(!$(e.target).closest('.is_view_btn').length) {
                        $(".more_opt.is_view_btn").hide();
                    }
                });
            });
            </script>
	        <?php
	        $link_buttons = ob_get_contents();
	        ob_end_flush();
			?>
	    </div>
	    <!-- } 게시물 상단 버튼 끝 -->
    </section>

    <section id="bo_v_atc">
        <h2 id="bo_v_atc_title">본문</h2>
        <div id="bo_v_share">
        	<?php include_once(G5_SNS_PATH."/view.sns.skin.php"); ?>
	        <?php if ($scrap_href) { ?><a href="<?php echo $scrap_href;  ?>" target="_blank" class="btn btn_b03" onclick="win_scrap(this.href); return false;"><i class="fa fa-bookmark" aria-hidden="true"></i> 스크랩</a><?php } ?>
	    </div>

        <?php
        // 파일 출력
        $v_img_count = count($view['file']);
        if($v_img_count) {
            echo "<div id=\"bo_v_img\">\n";

            foreach($view['file'] as $view_file) {
                echo get_file_thumbnail($view_file);
            }

            echo "</div>\n";
        }
         ?>

        <!-- 본문 내용 시작 { -->
        <div id="bo_v_con"><?php echo get_view_thumbnail($view['content']); ?></div>
        <?php //echo $view['rich_content']; // {이미지:0} 과 같은 코드를 사용할 경우 ?>
        <!-- } 본문 내용 끝 -->

        <?php if ($is_signature) { ?><p><?php echo $signature ?></p><?php } ?>


        <!--  추천 비추천 시작 { -->
        <?php if ( $good_href || $nogood_href) { ?>
        <div id="bo_v_act">
            <?php if ($good_href) { ?>
            <span class="bo_v_act_gng">
                <a href="<?php echo $good_href.'&amp;'.$qstr ?>" id="good_button" class="bo_v_good"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i><span class="sound_only">추천</span><strong><?php echo number_format($view['wr_good']) ?></strong></a>
                <b id="bo_v_act_good"></b>
            </span>
            <?php } ?>
            <?php if ($nogood_href) { ?>
            <span class="bo_v_act_gng">
                <a href="<?php echo $nogood_href.'&amp;'.$qstr ?>" id="nogood_button" class="bo_v_nogood"><i class="fa fa-thumbs-o-down" aria-hidden="true"></i><span class="sound_only">비추천</span><strong><?php echo number_format($view['wr_nogood']) ?></strong></a>
                <b id="bo_v_act_nogood"></b>
            </span>
            <?php } ?>
        </div>
        <?php } else {
            if($board['bo_use_good'] || $board['bo_use_nogood']) {
        ?>
        <div id="bo_v_act">
            <?php if($board['bo_use_good']) { ?><span class="bo_v_good"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i><span class="sound_only">추천</span><strong><?php echo number_format($view['wr_good']) ?></strong></span><?php } ?>
            <?php if($board['bo_use_nogood']) { ?><span class="bo_v_nogood"><i class="fa fa-thumbs-o-down" aria-hidden="true"></i><span class="sound_only">비추천</span><strong><?php echo number_format($view['wr_nogood']) ?></strong></span><?php } ?>
        </div>
        <?php
            }
        }
        ?>
        <!-- }  추천 비추천 끝 -->
    </section>

    <!-- 결제 모듈 추가 GOGOSING -->
<!--    <div class="sit_order_btn">-->
<!--        <button type="submit" onclick="document.pressed=this.value;" value="장바구니" class="sit_btn_cart">장바구니</button>-->
<!--        <button type="submit" onclick="document.pressed=this.value;" value="바로구매" class="sit_btn_buy">바로구매</button>-->
<!--    </div>-->

    <!-- CSS -->
   <style type="text/css">
       /* 주문서 작성 - 결제수단 */
        #sod_frm_pay {position:relative;margin:10px 0 0;background:#fff;border:1px solid #e3e5e8}
       #sod_frm_pay {position:relative;margin:10px 0 0}
       #sod_frm_pay h2 {font-size:1.167em;padding:15px;border-bottom:1px solid #e3e5e8}
       #sod_frm_pay .tooltip_txt {height:auto;line-height:18px;font-weight:normal;font-size:1em;padding:10px 20px;margin:10px}
       #sod_frm_pay .tooltip_txt i {float:left;line-height:36px;font-size:2em;margin-right:15px}
       #sod_frm_pay .tooltip_txt:before {height:100%}
       #sod_frm_pay input[type="radio"] {}
       #sod_frm_pay .lb_icon {display:inline-block;position:relative;cursor:pointer;z-index:1}
       #sod_frm_pay input[type="radio"]:checked+.lb_icon {color:#3a8afd;z-index:3}
       #sod_frm_pay input[type="radio"] + label span {top:7px}

        #sod_frm #sod_bsk_tot li:last-child {
            border-bottom: 0 none;
        }
        .sod_right #od_tot_price {
            border: 1px solid #e3e5e8;
        }
        #sod_frm_pay {
            position: relative;
            margin: 10px 0 0;
        }
        #sod_frm_pay .lb_icon {
            display: inline-block;
            position: relative;
            cursor: pointer;
            z-index: 1;
        }
        #od_pay_sl .lb_icon {
            display: inline-block;
            float: left;
            width: 50%;
            background: #fff;
            border: 1px solid #eceff4;
            margin: -1px 0 0 -1px;
            cursor: pointer;
            height: 60px;
            position: relative;
            padding-left: 65px;
            padding-top: 20px;
            z-index: 1;
        }
        #sod_frm #sod_frm_pt_alert {
            margin: 5px 0;
            color: #38b2bb;
        }
        #sod_frm_paysel .bank_icon {
            background: url(../../../img/pay_icon1.png) no-repeat 15px 50% #fff;
        }
        #sod_frm_paysel .KPAY {
            background: url(../../../img/kpay.png) no-repeat 50% 50% #fff;
            overflow: hidden;
            text-indent: -999px;
        }

        /* 버튼 */
       #display_pay_button {
           background: #fff;
           padding: 20px;
           border: 0px solid #e3e5e8;
           border-top: 0
       }
       #display_pay_button .btn_submit {
           width: 186px;
           float: left;
           margin-right: 5px;
           height: 50px;
           margin-bottom: 10px;
           font-weight: bold;
           font-size: 1.25em;
           /*width: 100%;*/
           /*height: 50px;*/
           /*font-weight: bold;*/
           /*font-size: 1.25em;*/
           /*cursor: pointer;*/
           /*border: 1px solid #3a8afd*/
       }

       #display_pay_button .btn01 {
           width: 186px;
           float: left;
           margin-right: 5px;
           height: 50px;
           margin-bottom: 10px;
           font-weight: bold;
           font-size: 1.25em;
           /*width: 100%;*/
           /*height: 50px;*/
           /*line-height: 38px;*/
           /*font-weight: bold;*/
           /*font-size: 1.25em;*/
           /*margin: 5px 0;*/
           /*border: 1px solid #ccd1d9*/
       }

       /*은행*/
       #settle_bank {border:1px solid #e3e5e8;border-top:0 none;background:#fff;padding:10px;clear:both;line-height:32px}
       #settle_bank:after {display:block;visibility:hidden;clear:both;content:''}
       #settle_bank label {float:left;width:30%;line-height:30px}
       #settle_bank select, #settle_bank input {width:20%;height:32px;margin:0 0 5px;border:1px solid #e3e5e8;border-radius:3px;text-align:left}
       #settle_bank option {padding:3px 0}
       #settle_bank #od_deposit_name {height:32px;padding:0 5px;border:1px solid #e3e5e8}

       .btn_confirm {
           text-align: center;
       }

       a.btn01 {
           display: inline-block;
           padding: 13px;
           border: 1px solid #ccc;
           background: #fafafa;
           color: #000;
           text-decoration: none;
           vertical-align: middle;
       }

       #forderform .sod_right #sod_bsk_tot {border:1px solid #e3e5e8}
        #forderform .od_pay_buttons_el{margin-top:20px;border:1px solid #e3e5e8;background:#fff;padding:10px}
        #forderform .od_pay_buttons_el h3{font-size:1.167em;margin:0px 0 5px}
        #forderform #sod_frm_pt{border-top:1px solid #e3e5e8}
    </style>

    <br/>
    <!-- gogosing start -->
    -- 결제 모듈 준비중 ---
    <br/>
    <br/>

    <?php
    // orderform.php
//    if($is_mobile_order) {
//        $order_action_url = G5_BBS_PATH.'/orderformupdate.php';
//        require_once(G5_BBS_PATH.'/orderform.sub.php');
//    } else {
//        $order_action_url = G5_BBS_PATH.'/orderformupdate.php';
//        require_once(G5_BBS_PATH.'/orderform.sub.php');
//    }

    if( $view['wr_1'] == '1') {
        $order_action_url = G5_BBS_PATH.'/orderformupdate.php';
        require_once(G5_BBS_PATH.'/orderform.sub.php');

//        var_dump("$order_action_url=",$order_action_url); // gogosing
    }
    ?>

    <script>
        jQuery(function($){
            $(".sit_order_btn").on("click", "button", function(e){
                e.preventDefault();

                var $this = $(this);

                // console.log("this : ",$this);

                if( $this.hasClass("sit_btn_cart") ){
                    $("#sit_ov_btn .sit_btn_cart").trigger("click");
                } else if ( $this.hasClass("sit_btn_buy") ) {
                    $("#sit_ov_btn .sit_btn_buy").trigger("click");
                }
            });

            // console.log("href : ",window.location.href);
            // console.log("href : ",window.location.href.split("#").length);

            if (window.location.href.split("#").length > 1) {
                let id = window.location.href.split("#")[1];
                alert("id",id);
                $("#btn_" + id).trigger("click");
            };
        });
    </script>
    <!-- gogosing end -->

    <?php
    $cnt = 0;
    if ($view['file']['count']) {
        for ($i=0; $i<count($view['file']); $i++) {
            if (isset($view['file'][$i]['source']) && $view['file'][$i]['source'] && !$view['file'][$i]['view'])
                $cnt++;
        }
    }
	?>

    <?php if($cnt) { ?>
    <!-- 첨부파일 시작 { -->
    <section id="bo_v_file">
        <h2>첨부파일</h2>
        <ul>
        <?php
        // 가변 파일
        for ($i=0; $i<count($view['file']); $i++) {
            if (isset($view['file'][$i]['source']) && $view['file'][$i]['source'] && !$view['file'][$i]['view']) {
         ?>
            <li>
               	<i class="fa fa-folder-open" aria-hidden="true"></i>
                <a href="<?php echo $view['file'][$i]['href'];  ?>" class="view_file_download">
                    <strong><?php echo $view['file'][$i]['source'] ?></strong> <?php echo $view['file'][$i]['content'] ?> (<?php echo $view['file'][$i]['size'] ?>)
                </a>
                <br>
                <span class="bo_v_file_cnt"><?php echo $view['file'][$i]['download'] ?>회 다운로드 | DATE : <?php echo $view['file'][$i]['datetime'] ?></span>
            </li>
        <?php
            }
        }
         ?>
        </ul>
    </section>
    <!-- } 첨부파일 끝 -->
    <?php } ?>

    <?php if(isset($view['link']) && array_filter($view['link'])) { ?>
    <!-- 관련링크 시작 { -->
    <section id="bo_v_link">
        <h2>관련링크</h2>
        <ul>
        <?php
        // 링크
        $cnt = 0;
        for ($i=1; $i<=count($view['link']); $i++) {
            if ($view['link'][$i]) {
                $cnt++;
                $link = cut_str($view['link'][$i], 70);
            ?>
            <li>
                <i class="fa fa-link" aria-hidden="true"></i>
                <a href="<?php echo $view['link_href'][$i] ?>" target="_blank">
                    <strong><?php echo $link ?></strong>
                </a>
                <br>
                <span class="bo_v_link_cnt"><?php echo $view['link_hit'][$i] ?>회 연결</span>
            </li>
            <?php
            }
        }
        ?>
        </ul>
    </section>
    <!-- } 관련링크 끝 -->
    <?php } ?>
    
    <?php if ($prev_href || $next_href) { ?>
    <ul class="bo_v_nb">
        <?php if ($prev_href) { ?><li class="btn_prv"><span class="nb_tit"><i class="fa fa-chevron-up" aria-hidden="true"></i> 이전글</span><a href="<?php echo $prev_href ?>"><?php echo $prev_wr_subject;?></a> <span class="nb_date"><?php echo str_replace('-', '.', substr($prev_wr_date, '2', '8')); ?></span></li><?php } ?>
        <?php if ($next_href) { ?><li class="btn_next"><span class="nb_tit"><i class="fa fa-chevron-down" aria-hidden="true"></i> 다음글</span><a href="<?php echo $next_href ?>"><?php echo $next_wr_subject;?></a>  <span class="nb_date"><?php echo str_replace('-', '.', substr($next_wr_date, '2', '8')); ?></span></li><?php } ?>
    </ul>
    <?php } ?>

    <?php
    // 코멘트 입출력
    include_once(G5_BBS_PATH.'/view_comment.php');
	?>
</article>
<!-- } 게시판 읽기 끝 -->

<script>
<?php if ($board['bo_download_point'] < 0) { ?>
$(function() {
    $("a.view_file_download").click(function() {
        if(!g5_is_member) {
            alert("다운로드 권한이 없습니다.\n회원이시라면 로그인 후 이용해 보십시오.");
            return false;
        }

        var msg = "파일을 다운로드 하시면 포인트가 차감(<?php echo number_format($board['bo_download_point']) ?>점)됩니다.\n\n포인트는 게시물당 한번만 차감되며 다음에 다시 다운로드 하셔도 중복하여 차감하지 않습니다.\n\n그래도 다운로드 하시겠습니까?";

        if(confirm(msg)) {
            var href = $(this).attr("href")+"&js=on";
            $(this).attr("href", href);

            return true;
        } else {
            return false;
        }
    });
});
<?php } ?>

function board_move(href)
{
    window.open(href, "boardmove", "left=50, top=50, width=500, height=550, scrollbars=1");
}
</script>

<script>
$(function() {
    $("a.view_image").click(function() {
        window.open(this.href, "large_image", "location=yes,links=no,toolbar=no,top=10,left=10,width=10,height=10,resizable=yes,scrollbars=no,status=no");
        return false;
    });

    // 추천, 비추천
    $("#good_button, #nogood_button").click(function() {
        var $tx;
        if(this.id == "good_button")
            $tx = $("#bo_v_act_good");
        else
            $tx = $("#bo_v_act_nogood");

        excute_good(this.href, $(this), $tx);
        return false;
    });

    // 이미지 리사이즈
    $("#bo_v_atc").viewimageresize();
});

function excute_good(href, $el, $tx)
{
    $.post(
        href,
        { js: "on" },
        function(data) {
            if(data.error) {
                alert(data.error);
                return false;
            }

            if(data.count) {
                $el.find("strong").text(number_format(String(data.count)));
                if($tx.attr("id").search("nogood") > -1) {
                    $tx.text("이 글을 비추천하셨습니다.");
                    $tx.fadeIn(200).delay(2500).fadeOut(200);
                } else {
                    $tx.text("이 글을 추천하셨습니다.");
                    $tx.fadeIn(200).delay(2500).fadeOut(200);
                }
            }
        }, "json"
    );
}
</script>
<!-- } 게시글 읽기 끝 -->