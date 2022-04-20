<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="css/styles.css" />
    <script src="https://kit.fontawesome.com/32b1007cf0.js" crossorigin="anonymous"></script>
    <title>Home 2</title>
</head>

<body>
<div class="container-fluid">
    <!--NAVBAR-->
    <jsp:include page="nav.jsp"></jsp:include>
    <!--END NAVBAR-->
    <div class="row">

        <!--SIDE BAR-->
        <jsp:include page="sideMenu.jsp"></jsp:include>
        <!--END SIDE BAR-->

        <!--CONTENT-->
        <div class="col-10 px-0">
            <div class="pt-5 ps-5 pe-5">
                <p class="h2 fw-normal mb-3">Booking List</p>
                <hr>
            </div>

            <div class="pt-5 ps-5 pe-5">
                <div>
                    <!--ADD CODE HERE-->
                    <table class="table">
                        <thead class="thead-dark">
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">Booking Office</th>
                            <th scope="col">Trip</th>
                            <th scope="col">Acction</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${listB}" var="b">
                        <tr>
                            <td>${b.officeId}</td>
                            <td>${b.officeName}</td>
                            <c:forEach items="${listT}" var="t">
                            <c:if test="${b.tripId==t.tripId}">
                            <td>${t.destination}</td>
                            </c:if>
                            </c:forEach>
                            <td><a href="ViewBooking?id=${b.officeId}">View</a></td>
                        </tr>
                        </c:forEach>

                        </tbody>
                    </table>


                    <!--END CODE HERE-->
                </div>
            </div>
        </div>
        <!--END CONTENT-->
    </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>

</html>