<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="springform"
	uri="http://www.springframework.org/tags/form"%> 
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>

<html>
<head>

<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.7.4/angular.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<title>Poornachandu Flowers Calculator</title>



<style>

 #boxcalc {
  background-color: lightgrey;
  width: 300px;
  border: 25px solid green;
  padding: 25px;
    margin-left: 5%;
}
.blue-button {
	background: #25A6E1;
	filter: progid: DXImageTransform.Microsoft.gradient( startColorstr='#25A6E1',
		endColorstr='#188BC0', GradientType=0);
	padding: 3px 5px;
	color: #fff;
	font-family: 'Helvetica Neue', sans-serif;
	font-size: 12px;
	border-radius: 2px;
	-moz-border-radius: 2px;
	-webkit-border-radius: 8px;
	border: 1px solid #1A87B9
}

.red-button {
	background: #CD5C5C;
	padding: 3px 5px;
	color: #fff;
	font-family: 'Helvetica Neue', sans-serif;
	font-size: 12px;
	border-radius: 2px;
	-moz-border-radius: 2px;
	
	-webkit-border-radius: 8px;
	border: 1px solid #CD5C5C
}

table {
	font-family: "Helvetica Neue", Helvetica, sans-serif;
	width: 60%;
	margin-left:35%;
	margin-right:10%;
	margin-top:-20%;
	background-color: infobackground;
}
 
caption {
	text-align: left;
	color: silver;
	font-weight: bold;
	text-transform: uppercase;
	padding: 5px;
}

th {
	background: SteelBlue;
	color: white;
}

tbody tr:nth-child(even) {
	background: WhiteSmoke;
}

tbody tr td:nth-child(2) {
	text-align: center;
}

tbody tr td:nth-child(3), tbody tr td:nth-child(4) {
	text-align: center;
	font-family: monospace;
}

tfoot {
	background: SeaGreen;
	color: white;
	text-align: right;
}

tfoot tr th:last-child {
	font-family: monospace;
}

td, th {
	border: 1px solid gray;
	width: 25%;
	text-align: left;
	padding: 5px 10px;
}
</style>




<script type="text/javascript">
	var app = angular.module("FlowerManagement", []);

	//Controller Part
	app.controller("FlowerController",
			function($scope, $http)
			{	
		$scope.flowers = [];
		$scope.flowerForm = {
			                		id : '',
			                customername : "",
			                mobileno : "",
			                dateofpurchase : "",
			                costofflowers : "",
			                quantityofflowers : "",
			                totalamountofflowers : "" };

						//Now load the data from server
						_refreshflowerData();
						

						//HTTP POST/PUT methods for add/edit flower 
						// with the help of id, we are going to find out whether it is put or post operation

						$scope.submitflower = function() 
						{

							var method = "";
							var url = "";
							if ($scope.flowerForm.id == '') {
								//Id is absent in form data, it is create new flower operation
								method = "POST";
								url = '/FlowerCalculator/addFlowers/';
							} else {
								//Id is present in form data, it is edit flower operation
								method = "PUT";
								url = '/FlowerCalculator/updateFlowers/';
							}

							$http({
								method : method,
								url : url,
								data : angular.toJson($scope.flowerForm),
								headers : {
									'Content-Type' : 'application/json'
								}
							}).then(_success, _error);
						};

						//HTTP DELETE- delete flower by Id
						$scope.deleteflower = function(flower) {
							$http(
									{
										method : 'DELETE',
										url : '/FlowerCalculator/deleteFlowers/'
												+ flower.id
									}).then(_success, _error);
						};

						// In case of edit, populate form fields and assign form.id with flower id
						$scope.editflower = function(flower) {

							$scope.flowerForm.id = flower.id;
							$scope.flowerForm.customername = flower.customername;
							$scope.flowerForm.mobileno = flower.mobileno;
							$scope.flowerForm.dateofpurchase = flower.dateofpurchase;
							$scope.flowerForm.costofflowers = flower.costofflowers;
							$scope.flowerForm.quantityofflowers = flower.quantityofflowers;
							$scope.flowerForm.totalamountofflowers = flower.totalamountofflowers;

						};

						/* Private Methods */
						//HTTP GET- get all flowers collection
						function _refreshflowerData() {
							$http(
									{
										method : 'GET',
										url : 'http://localhost:8086/FlowerCalculator/getAllFlowers'
									}).then(function successCallback(response) {
										
								$scope.flowers = response.data;
								
								mydate();
								
								
								
							}, function errorCallback(response) {
								console.log(response.statusText);
							});
						}

						function _success(response) {
							_refreshflowerData();
							
							_clearFormData()
						}

						function _error(response) {
							console.log(response.statusText);
						}

						//Clear the form
						function _clearFormData() {
							$scope.flowerForm.id = '';
							$scope.flowerForm.customername = '';
							$scope.flowerForm.mobileno = '';
							$scope.flowerForm.dateofpurchase = '';
							$scope.flowerForm.costofflowers = '';
							$scope.flowerForm.quantityofflowers = '';
							$scope.flowerForm.totalamountofflowers = '';

						}
						;
						
						
						function mydate()
						 {
							var todayDate= new Date();

							var todayDay=todayDate.getDate();
							var todayMonth=todayDate.getMonth()+1;
							var todayyear =todayDate.getFullYear();

							var inputDate=todayDay+'-'+todayMonth+'-'+todayyear;
							$scope.flowerForm.dateofpurchase = inputDate;
							
                          };
                          
                          $scope.AddNumbers = function() {
                              var a = $scope.flowerForm.costofflowers;
                              var b = $scope.flowerForm.quantityofflowers;
                              $scope.flowerForm.totalamountofflowers = a*b;
                          }
							
						
						
					});
</script>
<head>
<body ng-app="FlowerManagement" ng-controller="FlowerController" style="background-color:highlight;">
<div style="text-decoration-line: underline; text-decoration-style: wavy; color:maroon;">
	<h1 align="center" >Flowers Calculator</h1>
	</div>
	
	<p>Today Date : {{flowerForm.dateofpurchase | date:'dd/MM/yyyy'}}  </p> 
	
	<form ng-submit="submitflower()">
	
		
			
		<div align="center">
		<div >
				<label >DATE :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
				<input type="text"  ng-model="flowerForm.dateofpurchase" readonly="readonly" />
				
			</div>
			<br>
			<div>
				<label >CUSTOMERNAME :</label>
				<input type="text" ng-model="flowerForm.customername" />
			</div>
			<br>
			<div >
				<label >MOBILENO :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
				<input type="text" ng-model="flowerForm.mobileno" />
			</div>
	     </div>
	     
	    
	     
	     <div id="boxcalc">
	     <h4 align="center">CALCULATE FLOWERS COST</h4>
	
		
			<div align="center">
			<div>
				<label >KG COST :&nbsp;&nbsp;&nbsp;</label>
				<input type="text" ng-model="flowerForm.costofflowers" "/>
			</div>
			<br>
			<div >
				<label >QUANTITY :</label>
				<input type="text" ng-model="flowerForm.quantityofflowers" />
			</div>
	     </div>
			
			
			<br>
			<div style="margin-left: 55%;">
			
				<input type="button" value="Total"
					style="background-color: green;" ng-click="AddNumbers(flowerForm.costofflowers,flowerForm.quantityofflowers)"/>
					
				
				
				<input type="text"
	 				ng-model="flowerForm.totalamountofflowers" >
	 				
	 				<br>
			
			<br>
			
			<div>
						<input type="submit" value="submit"
					style="background-color: green;"/>
				</div>
		
			</div>
			</div>
			
			
			
		
     
    
	
	
	</form>
	<table>
		<tr>
			<th>ID</th>
			<th>CUSTOMER NAME</th>
			<th>MOBILE NO</th>
			<th>DATE OF PURCHASE</th>
			<th>COST/KGS</th>
			<th>QUANTITY Kgs/Gms</th>
			<th>TOTAL</th>
			<th colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;ACTION&nbsp;&nbsp;&nbsp;&nbsp;</th>

		</tr>

		<tr ng-repeat="flower in flowers">

			<td>{{ flower.id }}</td>
			<td>{{ flower.customername }}</td>
			<td>{{ flower.mobileno }}</td>
			<td>{{ flower.dateofpurchase }}</td>
			<td>{{ flower.costofflowers }}&nbsp;Rs/-</td>
			<td>{{ flower.quantityofflowers }}&nbsp;Kgs/Gms</td>
			<td>{{ flower.totalamountofflowers }}&nbsp;Rs/-</td>

			<td colspan="1"><a ng-click="editflower(flower)" class="blue-button">Edit</a>
				 <a ng-click="deleteflower(flower)" class="red-button">Delete</a></td>
		</tr>

	</table>


</body>
</html>