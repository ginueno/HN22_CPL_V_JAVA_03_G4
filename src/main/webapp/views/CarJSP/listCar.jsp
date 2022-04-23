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
    <script src="views/CarJSP/validateCar.js"></script>
    <title>List Car</title>
</head>

<body>
<div class="container-fluid">
    <!--NAVBAR-->
    <div class="row">
        <div class="col-2 px-0">
            <li class="list-group-item bg-light border-end-0 border-top-0 border-start-0">
                <a class="nav-link text-secondary text-decoration-none" href="#">
                    <i class="fas fa-users"></i>
                    Car
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
                            <i class="fas fa-car"></i>
                            Car manager
                        </a>
                    </li>
                    <div id="abc" class="">
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item border-bottom-0 bg-light">
                                <a href="${pageContext.request.contextPath}/listCar" class="ms-3 nav-link link-primary">
                                    <i class="fas fa-list"></i>
                                    Car list
                                </a>
                            </li>
                            <li class="list-group-item border-bottom bg-light">
                                <a href="${pageContext.request.contextPath}/addCar" class="ms-3 nav-link link-primary">
                                    <i class="fas fa-plus"></i>
                                    Add Car
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
                <p class="h2 fw-normal mb-3">Car list</p>
                <hr>
            </div>

            <!--Serch-->
            <div>
                <form class="form-inline" action="${pageContext.request.contextPath}/searchCar" method="get">
                    <div class="row">
                        <div class="col-sm-4"></div>
                        <div class="col-sm-4">
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                        <span class="input-group-text">
                                            <i class="fa-solid fa-magnifying-glass"></i><br>
                                        </span>
                                </div>
                                <input type="text" id="search" name="keyword" class="form-control"
                                       value="${keyword}" placeholder="Car search">
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                        <span class="input-group-text">
                                            <i class="fa-solid fa-filter"></i>&nbsp; Search by
                                        </span>
                                </div>
                                <select class="form-select" id="criteria" name="criteria">
                                    <option value="licensePlate" ${criteria=="licensePlate" ? 'selected':''}>License plate</option>
                                    <option value="carColor" ${criteria=="carColor" ? 'selected':''}>Color</option>
                                    <option value="carType" ${criteria=="carType" ? 'selected':''}>Type</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-sm-1">
                            <button type="submit" class="btn btn-primary">
                                Search
                            </button>
                        </div>
                    </div>
                </form>
            </div>

            <!--Serch-->

            <div class="pt-5 ps-5 pe-5">
                <%--Phan trang--%>

                <%--Phan trang--%>
                <div>
                    <!--ADD CODE HERE-->
                    <table class="table table-striped table-bordered">
                        <thead class="bg-light border-bottom-0">
                        <tr>
                            <th scope="col" style="width: 16%">License plate</th>
                            <th scope="col" style="width: 16%">Car color</th>
                            <th scope="col" style="width: 16%">Car type</th>
                            <th scope="col" style="width: 16%">Company</th>
                            <th scope="col" style="width: 16%">Park ID</th>
                            <th scope="col" style="width: 20%">Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${requestScope.listCars}" var="car">
                            <tr>
                                <td class="">${car.licensePlate}</td>
                                <td class="">${car.carColor}</td>
                                <td class="">${car.carType}</td>
                                <td class="">${car.company}</td>
                                <td class="">${car.parkId}</td>
                                <td class="">
                                <span class="me-3">
                                <a href="${pageContext.request.contextPath}/updateCar?licensePlate=${car.licensePlate}"
                                   class="text-decoration-none"><i class="fas fa-edit"></i> Edit</a>
                                </span>
                                    <span>
                                <a onclick="return confirmMes()" href="${pageContext.request.contextPath}/deleteCar?licensePlate=${car.licensePlate}"
                                   class="text-decoration-none"><i class="fas fa-trash-alt"></i> Delete</a>
                                    </span>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <c:forEach begin="1" end="${end}" var="i">
                        <a href="${pageContext.request.contextPath}/listCar?index=${i}">${i}</a>
                    </c:forEach>

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