
<%--@elvariable id="id" type="net"--%>
<%--@elvariable id="address" type=""--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Employee Form</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

</head>
<style>
    .txt-header{
        font-family:Roboto;
        font-size: 35px;
        padding-top: 50px;
        color: #d35400;

    }
    .textBold{
        font-weight: bold;
    }
    .input{
        border-radius: 0px 16px 0px 16px;
        box-shadow: 0px 0px 10px rgba(0,0,0,0.18);
    }
    .input:focus{
        border-radius: 16px 0px 16px 0px;
        box-shadow: 0px 0px 20px rgba(0,0,0,0.22);
    }

</style>
<body onload="loadAllEmployees()">
<div class="container-fluid">

<p class="txt-header">Employee Form</p>
    <hr>
    <hr>
    <br>

    <div class="row">
        <div class="col-12 col-sm-6 col-md-3">


            <div class="form-group">
                <label class="textBold" for="EmployeeID">Employee ID</label>
                <input type="text" class="form-control input" id="EmployeeID" aria-describedby="idHelp"placeholder="EX:- E-001">
            </div>

        </div>
        <div class="col-12 col-sm-6 col-md-3">


            <div class="form-group">
                <label class="textBold"  for="EmployeeName">Employee Name</label>
                <input type="text" class="form-control input" id="EmployeeName" aria-describedby="nameHelp"placeholder="EX:- Nimal">
            </div>


        </div>

        <div class="col-12">

            <div class="form-group">
                <label  class="textBold" for="EmployeeAddress">Employee Address</label>
                <textarea class="form-control input" id="EmployeeAddress" rows="3"placeholder="Address here"></textarea>
            </div>

        </div>

        <div class="col-12 col-sm-6 col-md-3">

            <div class="form-group">
                <label class="textBold"  for="EmployeeAge">Employee Age</label>
                <input type="text" class="form-control input" id="EmployeeAge" aria-describedby="AgeHelp"placeholder="EX:- 25 (Maximum 3 numbers)">
            </div>


        </div>
    </div>

    <hr>
    <p style="text-align: right">

        <input type="button" id="ButtonSave"  value="Save Employee" class="btn btn-primary">
        &nbsp;

        <input type="button" id="ButtonUpdate" value="Update Employee" class="btn btn-warning">
        &nbsp;

        <input type="button"  id="ButtonDelete" value="Delete Employee" class="btn btn-danger">
    </p>

    <table class="table">
        <thead class="bg-dark text-white">
        <tr>
            <th scope="col">ID</th>
            <th scope="col">NAME</th>
            <th scope="col">ADDRESS</th>
            <th scope="col">AGE</th>
        </tr>
        </thead>
        <tbody class="tBody">
        </tbody>
    </table>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<%--<script src="main.js"></script>--%>
<script>


    //Save Employee
    $("#ButtonSave").click(function () {

        let id = $("#EmployeeID").val()
        let name = $("#EmployeeName").val()
        let address = $("#EmployeeAddress").val()
        let age = $("#EmployeeAge").val()

        $.ajax({
            method: "post",
            url: "http://localhost:8090/Employee",
            contentType: "application/json",
            data: JSON.stringify({
                "id": id,
                "name": name,
                "address": address,
                "age": age
            }),
            success: function (res) {
                if (res.message == "Success") {
                    loadAllEmployees();
                    alert("Employee Added");
                } else {
                    alert(res.data);
                }


            }
        });

    });

    //Update Employee
    $("#ButtonUpdate").click(function () {
        let id = $("#EmployeeID").val();
        let name = $("#EmployeeName").val();
        let address = $("#EmployeeAddress").val();
        let age = $("#EmployeeAge").val();

        $.ajax({
            method: "put",
            url: "http://localhost:8090/Employee",
            contentType: "application/json",
            data: JSON.stringify({
                "id": id,
                "name": name,
                "address": address,
                "age": age
            }),
            success: function (res) {
                if (res.message == "Success") {
                    alert("Employee Updated");
                } else {
                    alert(res.data);
                }
                loadAllEmployees();
            }
        });
    });


    //Delete Employees
    $("#ButtonDelete").click(function () {
                    let ID = $("#EmployeeID").val();
                    $.ajax({
                        method: "delete",
                        url: "http://localhost:8090/Employee?id=" + ID,
                        success: function (res) {
                            if (res.message == "Success") {
                                alert("Employee Removed..!");
                            } else {
                                alert(res.data);
                            }
                            loadAllEmployees();
                        }

                    });
        });


    //Search Employees By ID
    $("#EmployeeID").on('keypress', function (e) {
        if (e.code == "Enter") {
            let ID = $("#EmployeeID").val();
            $.ajax({
                url: "http://localhost:8090/Employee/" + ID,
                success: function (res) {
                    console.log(res);
                    let employee = res.data;
                    // set details to input fields
                    $("#EmployeeID").val(employee.id);
                    $("#EmployeeName").val(employee.name);
                    $("#EmployeeAddress").val(employee.address);
                    $("#EmployeeAge").val(employee.age);

                }
            });
        }
    });


    //Load All Employees
    function loadAllEmployees() {
        $(".tBody").empty();
        let table=$('.tBody');
        $.ajax({
            url: "http://localhost:8090/Employee",
            type:'get',
            dataType:'json',
            contentType:'application/json',
            success:function (resp) {

                $.each(resp.data,function (idx,elme) {

                    let row='<tr>'+
                        '<td>'+elme.id+'</td>'+
                        '<td>'+elme.name+'</td>'+
                        '<td>'+elme.address+'</td>'+
                        '<td>'+elme.age+'</td>'+

                        '</tr>'

                    table.append(row);

                })

            },

        });
    }


</script>
</body>
</html>