// $("#ButtonSave").click(function () {
//
//     let id = $("#EmployeeID").value()
//     let name = $("#EmployeeName").value()
//     let address = $("#EmployeeAddress").value()
//     let age = $("#EmployeeAge").value()
//
//     $.ajax({
//         method: "post",
//         url: "http://localhost:8080/Employee",
//         contentType: "application/json",
//         data: JSON.stringify({
//             "id": id,
//             "name": name,
//             "address": address,
//             "age": age
//         }),
//         success: function (res) {
//             if (res.message == "Success") {
//                 alert("Employee Added");
//             } else {
//                 alert(res.data);
//             }
//             // loadAllEmployees();
//
//         }
//     });
//
// });
//
