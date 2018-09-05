<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
</head>
<style>

/* Pie Chart */
.progress-pie-chart {
  width: 200px;
  height: 200px;
  border-radius: 50%;
  background-color: #e5e5e5;
  position: relative;
}
.progress-pie-chart.gt-50 {
  background-color: #81ce97;
}

.ppc-progress {
  content: "";
  position: absolute;
  border-radius: 50%;
  left: calc(50% - 100px);
  top: calc(50% - 100px);
  width: 200px;
  height: 200px;
  clip: rect(0, 200px, 200px, 100px);
}
.ppc-progress .ppc-progress-fill {
  content: "";
  position: absolute;
  border-radius: 50%;
  left: calc(50% - 100px);
  top: calc(50% - 100px);
  width: 200px;
  height: 200px;
  clip: rect(0, 100px, 200px, 0);
  background: #81ce97;
  transform: rotate(60deg);
}
.gt-50 .ppc-progress {
  clip: rect(0, 100px, 200px, 0);
}
.gt-50 .ppc-progress .ppc-progress-fill {
  clip: rect(0, 200px, 200px, 100px);
  background: #e5e5e5;
}
.ppc-percents {
  content: "";
  position: absolute;
  border-radius: 50%;
  left: calc(50% - 173.91304px/2);
  top: calc(50% - 173.91304px/2);
  width: 173.91304px;
  height: 173.91304px;
  background: #fff;
  text-align: center;
  display: table;
}
.ppc-percents span {
  display: block;
  font-size: 2.6em;
  font-weight: bold;
  color: #81ce97;
}

.pcc-percents-wrapper {
  display: table-cell;
  vertical-align: middle;
}

.progress-pie-chart {
  margin: 50px auto 0;
}

</style>
<body>
	<div style="width:100%;height:100%;">
         <div class="progress-pie-chart" data-percent="40" onclick="test()">
            <!--Pie Chart -->
            <div class="ppc-progress">
               <div class="ppc-progress-fill"></div>
            </div>
            <div class="ppc-percents">
               <div class="pcc-percents-wrapper">
                  <span>%</span>
               </div>
            </div>
         </div>
         <!--End Chart -->
         </div>
</body>
<script type="text/javascript">
   //class명이 .progress-pie-chart인 차트값 가져온다.
   var $ppc = $('.progress-pie-chart');
   var percent = parseInt($ppc.data('percent'));
   var deg = 360 * percent / 100;
   $(function() {
      if (percent > 50) {
         $ppc.addClass('gt-50');
      }
      $('.ppc-progress-fill').css('transform', 'rotate(' + deg + 'deg)');
      $('.ppc-percents span').html(percent + '%');
   });

    function test() {
      var test = prompt("z", "z");
      if (test > 100) {
         alert('100이상은 입력할수없습니다.');
      } else {
         percent = test;
         deg = 360 * percent / 100;
         if (percent > 50) {
            $ppc.addClass('gt-50');
         }
         $('.ppc-progress-fill').css('transform', 'rotate(' + deg + 'deg)');
         $('.ppc-percents span').html(percent + '%');
      }
   } 
</script>
</html>