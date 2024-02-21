<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="com.beanclass.CenterCode" %>
<%@ page import="com.daoclass.DistinctYear" %> 
<%@ page import="java.util.ArrayList" %>   
<%@ page import="com.beanclass.StokeYear" %>
<%@ page import="com.daoclass.StrokeDao" %>
<%@ page import="com.beanclass.CoiceByYear" %>
<%@ page import="com.daoclass.CooseByYearDao" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<style>

.firstradio {
display:flex;
justify-content:space-around;
}
.secondstep1{
display:flex;
justify-content:space-around;
}
body{
background-color:#ebfaf9

}
.insidefirstdiv{
 width:80%;
}
form{
width:100%;
margin-top:5vh;

}

.firstform{
display:flex;
justify-content: center; /* Center horizontally */
align-items: center; /* Center vertically */
font-weight:bold;
}
.gobutton{
margin-left:50%;
margin-top:20vh;
padding:1rem;
font-family:Cooper Black;
font-size:20px;
color:red;
border-radius:10px;
cursor:pointer;
}
select{
 width:200px;
 height:30px;
 border-radius:5px;
 font-size:18px;
 font-weight:bold;
}
.graphchart{
margin-top:10vh;
}
<%-- trying --%>

button {
 display: inline-block;
 width: 150px;
 height: 50px;
 border-radius: 10px;
 border: 1px solid #03045e;
 position: relative;
 overflow: hidden;
 transition: all 0.5s ease-in;
 z-index: 1;
}

button::before,
button::after {
 content: '';
 position: absolute;
 top: 0;
 width: 0;
 height: 100%;
 transform: skew(15deg);
 transition: all 0.5s;
 overflow: hidden;
 z-index: -1;
}

button::before {
 left: -10px;
 background: #240046;
}

button::after {
 right: -10px;
 background: #5a189a;
}

button:hover::before,
button:hover::after {
 width: 58%;
 color:white;
}

button:hover span {
 color: #e0aaff;
 transition: 0.3s;
}

button span {
 color: #03045e;
 font-size: 18px;
 transition: all 0.3s ease-in;
}



</style>
<body>
	<%
		DistinctYear distinctYear = new DistinctYear();
		ArrayList<CenterCode> cc = distinctYear.showAllCenter();

		StrokeDao stroke = new StrokeDao();
		ArrayList<StokeYear>sty = stroke.showAllYear();
	%>
		<% ArrayList<CoiceByYear> myList = (ArrayList<CoiceByYear>) session.getAttribute("yeardata"); %>
	<div class="firstform">
		<div class="insidefirstdiv">
			<form action="graphdata" method="post">
				<div class="firstradio">
					<div>
						<input type="radio" id="radio1" name="option" value="center"
							onclick="showSelect()"> CENTER-WISE<br>
					</div>
					<div>
						<input type="radio" id="radio2" name="option" value="year"
							onclick="showSelect()"> YEAR- WISE<br>
					</div>
				</div>
				<div id="secondstep" class="secondstep1">
					<div id="selectDiv" style="display: none; margin-top: 10px;">
						<label for="cars">CHOOSE A CENTER:</label> <select id="cars"
							name="center">
							<%
								for (int i = 0; i < cc.size(); i++) {
							%>
							<%
								CenterCode cd = (CenterCode) cc.get(i);
							%>
							<option value="<%=cd.getCentercode()%>"><%=cd.getCentercode()%></option>
							<%
								}
							%>
							
						</select>

						<div style="display: flexl; margin-top: 10px;">
							<div>
								<input type="radio" id="radio3" name="option1" value="month"
									onclick="showSelect1()">BY MONTH<br>
							</div>
							<div>
								<input type="radio" id="radio4" name="option1" value="year1"
									onclick="showSelect1()">BY YEAR<br>
							</div>
						</div>
					</div>



					<div id="selectDiv1" style="display: none; margin-top: 10px;">
						<label for="cars">CHOOSE A YEAR:</label> <select id="cars"
							name="yearfromoption">
							<%
								for (int i = 0; i < sty.size(); i++) {
							%>
							<%
								StokeYear stokey = (StokeYear) sty.get(i);
							%>
							<option value="<%=stokey.getYear()%>"><%=stokey.getYear()%></option>
							<%
								}
							%>

						</select>
					</div>


				</div>
				<%--  SECOND RADIO BUTTON FOR BY MONTH --%>
				<div id="selectDiv2"
					style="display: none; text-align: center; margin-top: 10px;">
					<label for="cars">CHOOSE A YEAR NOW:</label> <select id="cars"
						name="yearfromchoose">

						<%
							for (int i = 0; i < sty.size(); i++) {
						%>
						<%
							StokeYear stokey = (StokeYear) sty.get(i);
						%>
						<option value="<%=stokey.getYear()%>"><%=stokey.getYear()%></option>
						<%
							}
						%>


					</select>
				</div>
				<div>
					<button type="submit" class="gobutton">GO!</button>
				</div>

			</form>
		</div>
	</div>
	<div class="graphchart">
	         	<div id="chartContainer" style="height: 500px; width: 100%;"></div>
	</div>
	
	<script>
		function showSelect() {
			var selectDiv = document.getElementById("selectDiv");
			var radio1 = document.getElementById("radio1");
			var radio2 = document.getElementById("radio2");

			if (radio1.checked) {
				selectDiv.style.display = "block";
				selectDiv1.style.display = "none";
			} else {
				selectDiv1.style.display = "block";
				selectDiv.style.display = "none";
				selectDiv2.style.display = "none";
			}
		}

		function showSelect1() {
			var selectDiv = document.getElementById("selectDiv2");
			var radio3 = document.getElementById("radio3");
			var radio4 = document.getElementById("radio4");

			if (radio3.checked) {
				selectDiv2.style.display = "block";

			} else {

				selectDiv2.style.display = "none";
			}
		}
	</script>
		<script src="https://cdn.canvasjs.com/canvasjs.min.js"></script>
		
		<script>
window.onload = function () {

	var chart = new CanvasJS.Chart("chartContainer", {
		animationEnabled: true,
		theme: "light2", // "light1", "light2", "dark1", "dark2"
		title:{
			text: "STROKE CASES BY YEAR"
		},
		axisY: {
			title: "TOTAL CASES"
		},
		data: [{        
			type: "column",  
			showInLegend: true, 
			legendMarkerColor: "grey",
			legendText: "CENTER CODE",
			dataPoints: [    
			         	<% for(int i=0;i<myList.size();i++){
							%>
							<%
							CoiceByYear alltable=(CoiceByYear)myList.get(i);
							
							%>
							{ y: <%=alltable.getCenterdata()%>, label: "<%=alltable.getCentercode() %>" },
				               <% 
							}%>
			<%--{ y: 1000, label: "2018" },
				{ y: 1900,  label: "2019" },
				{ y: 5334,  label: "2020" },
				{ y: 11978,  label: "2021" },
				{ y: 17803,  label: "2020" },
				{ y: 7288, label: "2023" },
				 --%>	
	           
			]
		}]
	});
	chart.render();

	}

</script>
</body>
</html>