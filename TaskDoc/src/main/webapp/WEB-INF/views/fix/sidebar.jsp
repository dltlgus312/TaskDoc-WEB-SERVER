<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>

<style>
/*font-color 지정 */
/* 16진수 표현 가능 */
.myspan {
	color: #ff0000;
}

/* rgb로 색상 표현 가능 */
.myspan {
	color: rgb(255, 0, 0);
}

/*rgba로 색상 표현 가능, a는 투명도 조절
    (opcity랑 비슷한 기능인것 같음 ) */
.myspan {
	color: rgba(255, 0, 0, 0.5);
}
</style>


<style>
/*font-size 지정 */
/*EX1 ) 기본 font-size의 em은 16px이 기준이다 . 
    하지만 기준 size는 유동적 (부모 font-size에 의해서 상속됨 )
    으로 변경 가능하다*/
    .myspan {
	font-size: 1em;
}

/*EX2 ) 부모의 font-size로 의해 기준 px는 32px */
body>div {
	font-size: 32px;
}

.myspan {
    /*부모 font-size가 32px이므로 기준px는 32px 1em= 1*32=32px*/
	font-size :1em;
    /*부모 font-size가 32px이므로 기준px는 32px 2em= 2*32=64px*/
	font-size :2em;
	
}
</style>

</body>
</html>