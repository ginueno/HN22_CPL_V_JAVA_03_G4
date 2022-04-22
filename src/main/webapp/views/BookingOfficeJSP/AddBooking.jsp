<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>Home 2</title>
</head>

<body>
<div class="container-fluid">
    <!--NAVBAR-->
    <div class="row">
        <div class="col-2 px-0">
            <li class="list-group-item bg-light border-end-0 border-top-0 border-start-0">
                <a class="nav-link text-secondary text-decoration-none" href="#">
                    <i class="fas fa-users"></i>
                    Employee
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
                    <li class="list-group-item bg-light">
                        <a href="#" class="nav-link link-primary">
                            <i class="fas fa-tachometer-alt"></i>
                            Dashboard
                        </a>
                    </li>
                    <li class="list-group-item border-bottom bg-light">
                        <a href="#abc" class="nav-link link-primary" data-bs-toggle="collapse">
                            <i class="fas fa-chart-bar"></i>
                            Employee manager
                        </a>
                    </li>
                    <div id="abc" class="">
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item border-bottom-0 bg-light">
                                <a href="#" class="ms-3 nav-link link-primary">
                                    <i class="fas fa-list"></i>
                                    Employee list
                                </a>
                            </li>
                            <li class="list-group-item border-bottom bg-light">
                                <a href="#" class="ms-3 nav-link link-primary">
                                    <i class="fas fa-plus"></i>
                                    Add Employee
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
                <p class="h2 fw-normal mb-3">Add Booking Office</p>
                <hr>
            </div>

            <div class="pt-5 ps-5 pe-5">
                <div>
                    <!--ADD CODE HERE-->

                    <form action="AddBooking" method="post">
                        <div class="row mb-3">
                            <div class="col-2">
                                <label class="fw-bold" role="button" for="txtDestination">
                                    <span>Booking office name </span>
                                    <span class="text-danger">(*)</span>
                                </label>
                            </div>
                            <div class="col-5">
                                <input type="text" class="form-control" id="txtDestination" required name="name"
                                       placeholder="Enter name">
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-2">
                                <label class="fw-bold" role="button" for="txtDepartureTime">
                                    <span>Trip </span>
                                    <span class="text-danger">(*)</span>
                                </label>
                            </div>
                            <div class="col-5">
                                <select name="trip" class="form-control" id="txtDepartureTime">
                                    <c:forEach items="${listC}" var="c">
                                        <option value="${c.tripId}">${c.destination}</option>
                                    </c:forEach>
                                </select><br>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-2">
                                <label class="fw-bold" role="button" for="txtDriver">
                                    <span>Phone number</span>
                                    <span class="text-danger">(*)</span>
                                </label>
                            </div>
                            <div class="col-5">
                                <input type="tel" pattern="[0]{1}[0-9]{9}" class="form-control" id="txtDriver" required name="phone"
                                       placeholder="Enter phone">
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-2">
                                <label class="fw-bold" role="button" for="txtCarType">
                                    <span>Place</span>
                                    <span class="text-danger">(*)</span>
                                </label>
                            </div>
                            <div class="col-5">
                                <select name="place" class="form-control" id="txtCarType">
                                    <c:forEach items="${listB}" var="b">
                                        <option>${b.officePlace}</option>
                                    </c:forEach>
                                </select><br>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-2">
                                <label class="fw-bold" role="button" for="txtMaximumTickerNumber">
                                    <span>Price</span>
                                    <span class="text-danger">(*)</span>
                                </label>
                            </div>
                            <div class="col-5">
                                <input type="text" class="form-control" required id="txtMaximumTickerNumber"
                                       name="price" placeholder="0">
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-2">
                                <label class="fw-bold" role="button" for="txtDepartureDate">
                                    <span>From Date</span>
                                    <span class="text-danger">(*)</span>
                                </label>
                            </div>
                            <div class="col-5">
                                <input type="date" class="form-control" name="dateFrom" required id="txtDepartureDate"><br>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-2">
                                <label class="fw-bold" role="button" for="txtDepartureDate2">
                                    <span>To Date</span>
                                    <span class="text-danger">(*)</span>
                                </label>
                            </div>
                            <div class="col-5">
                                <input type="date" class="form-control" name="dateTo" required id="txtDepartureDate2"><br>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-7 text-center">
                                <button type="reset" class="btn btn-warning"><i class="fas fa-undo"></i>
                                    Reset</button>
                                <button type="submit" class="btn btn-success"><i class="fas fa-plus"></i>
                                    Add</button>
                            </div>
                        </div>
                    </form>

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