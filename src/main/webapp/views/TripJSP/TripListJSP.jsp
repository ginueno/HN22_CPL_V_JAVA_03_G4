<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="css/styles.css"/>
    <script src="https://kit.fontawesome.com/32b1007cf0.js" crossorigin="anonymous"></script>
    <title>Trip List</title>
</head>

<body>
<div class="container-fluid">
    <!--NAVBAR-->
    <div class="row">
        <div class="col-2 px-0">
            <li class="list-group-item bg-light border-end-0 border-top-0 border-start-0">
                <a class="nav-link text-secondary text-decoration-none" href="#">
                    <i class="fas fa-plane"></i>
                    Trip
                </a>
            </li>
        </div>
        <div class="col-10 px-0">
            <div class="nav-link bg-light d-flex flex-row-reverse border-bottom">
                <a class="nav-link link-primary text-decoration-none" href="#">
                    <i class="fas fa-sign-out-alt"></i>
                    Logout
                </a>
                <a class="nav-link link-primary text-decoration-none me-4" href="#">
                    Welcome %name%
                </a>
            </div>
        </div>
    </div>
    <!--END NAVBAR-->
    <div class="row">

        <!--SIDE BAR-->
        <div class="col-2 px-0">
            <div class="bg-light vh-100 border-end">
                <ul class="list-group list-group-flush">
                    <li class="list-group-item border-bottom bg-light">
                        <a href="#abc" class="nav-link link-primary" data-bs-toggle="collapse">
                            <i class="fas fa-plane"></i>
                            Trip manager
                        </a>
                    </li>
                    <div id="abc" class="">
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item border-bottom-0 bg-light">
                                <a href="${pageContext.request.contextPath}/trip-list" class="ms-3 nav-link link-primary">
                                    <i class="fas fa-list"></i>
                                    Trip list
                                </a>
                            </li>
                            <li class="list-group-item border-bottom bg-light">
                                <a href="${pageContext.request.contextPath}/trip-add" class="ms-3 nav-link link-primary">
                                    <i class="fas fa-plus"></i>
                                    Add Trip
                                </a>
                            </li>
                        </ul>
                    </div>
                </ul>
            </div>
        </div>
        <!--END SIDE BAR-->

        <!--CONTENT-->
        <div class="col-10 px-0">
            <div class="pt-5 ps-5 pe-5">
                <p class="h2 fw-normal mb-3">Trip list <c:if test="${requestScope.message ne null}"><span class="text-danger">${requestScope.message}</span></c:if></p>
                <hr>
            </div>

            <div class="pt-5 ps-5 pe-5">
                <div class="">
                    <!--ADD CODE HERE-->
                    <form class="form-inline" action="${pageContext.request.contextPath}/search-emp" method="post">
                        <div class="row">
                            <div class="col-4"></div>
                            <div class="col-8">
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">
                                            <i class="fa-solid fa-magnifying-glass"></i><br>
                                        </span>
                                    </div>
                                    <input type="text" id="search" name="search" class="form-control"
                                           value="${search}" placeholder="User search">
                                    <button type="submit" class="btn btn-info text-white">
                                        Search
                                    </button>
                                </div>
                            </div>
                        </div>
                    </form>
                    <c:choose>
                        <c:when test="${requestScope.tripList.size() != 0}">
                            <table class="table table-striped table-bordered">
                                <thead class="bg-light border-bottom-0">
                                <tr>
                                    <th scope="col" style="width: 5%">No</th>
                                    <th scope="col" style="width: 15%">Destination</th>
                                    <th scope="col" style="width: 15%">Departure time</th>
                                    <th scope="col" style="width: 15%">Driver</th>
                                    <th scope="col" style="width: 15%">Car type</th>
                                    <th scope="col" style="width: 15%">Booked ticket number</th>
                                    <th scope="col" style="width: 20%">Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${requestScope.tripList}" var="trip">
                                    <tr>
                                        <td class="">${trip.tripId}</td>
                                        <td class="">${trip.destination}</td>
                                        <td class=""><fmt:formatDate type="time" value="${trip.departureTime}" pattern="HH:mm"/></td>
                                        <td class="">${trip.driver}</td>
                                        <td class="">${trip.carType}</td>
                                        <td class="">${trip.bookedTicketNumber}</td>
                                        <td class=""><span class="me-3">
                                            <a href="${pageContext.request.contextPath}/trip-edit?tripId=${trip.tripId}"
                                               class="text-decoration-none"><i class="fas fa-edit"></i> Edit</a>
                                        </span>
                                            <span>
                                            <a href="${pageContext.request.contextPath}/trip-delete?tripId=${trip.tripId}"
                                               class="text-decoration-none"><i class="fas fa-trash-alt"></i> Delete</a>
                                        </span>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </c:when>
                        <c:otherwise>
                            <p class="H3 text-center">There is no trip</p>
                        </c:otherwise>
                    </c:choose>
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
