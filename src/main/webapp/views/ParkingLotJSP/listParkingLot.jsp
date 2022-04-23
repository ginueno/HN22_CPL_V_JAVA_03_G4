<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <title>Parking Lot</title>
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
                <p class="h2 fw-normal mb-3">Parking lot list</p>
                <hr>
            </div>

            <div class="pt-5 ps-5 pe-5">
                <!--SEARCH HERE-->
                <div>
                    <form class="form-inline" action="${pageContext.request.contextPath}/searchParkingLot" method="get">
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
                                           value="${keyword}" placeholder="Parking lot search">
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">
                                            <i class="fa-solid fa-filter"></i>&nbsp; Filter by
                                        </span>
                                    </div>
                                    <select class="form-select" id="criteria" name="criteria">
                                        <option value="id" ${criteria=="id" ? 'selected':''}>Id</option>
                                        <option value="name" ${criteria=="name" ? 'selected':''}>Parking lot</option>
                                        <option value="place" ${criteria=="place" ? 'selected':''}>Place</option>
                                        <option value="area" ${criteria=="area" ? 'selected':''}>Area</option>
                                        <option value="price" ${criteria=="price" ? 'selected':''}>Price</option>
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
                <!--SEARCH END-->
                <div>
                    <!--ADD CODE HERE-->

                    <table class="table table-striped table-bordered">
                        <thead class="bg-light border-bottom-0">
                        <tr>
                            <th scope="col" style="width: 5%">No</th>
                            <th scope="col" style="width: 20%">Parking lot</th>
                            <th scope="col" style="width: 15%">Place</th>
                            <th scope="col" style="width: 10%">Area</th>
                            <th scope="col" style="width: 15%">Price</th>
                            <th scope="col" style="width: 10%">Status</th>
                            <th scope="col" style="width: 10%">Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${ListParkingLot}" var="item">
                            <tr>
                                <td>${item.parkId}</td>
                                <td>${item.parkName}</td>
                                <td>${item.parkPlace}</td>
                                <td><fmt:formatNumber type = "number"  groupingUsed = "false" value = "${item.parkArea}" /></td>
                                <td><fmt:formatNumber type = "number"  groupingUsed = "false" value = "${item.parkPrice}" /></td>
                                <td>${item.parkStatus}</td>
                                <td>
                                    <span class="me-3">
                                    <a href="${pageContext.request.contextPath}/editParkingLot?id=${item.parkId}"
                                       class="text-decoration-none"><i class="fas fa-edit"></i> Edit</a>
                                    </span>
                                    <span>
                                    <a href="${pageContext.request.contextPath}/deleteParkingLot?id=${item.parkId}"
                                       class="text-decoration-none" onclick="return confirm('Are you sure to delete ${item.parkName} ?')"><i class="fas fa-trash-alt"></i> Delete</a>
                                    </span>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <!--END CODE HERE-->
                </div>
            </div>
            <div class="row ">
                <nav aria-label="Page navigation example">
                    <ul class="pagination justify-content-center">
                        <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item"><a class="page-link" href="#">Next</a></li>
                    </ul>
                </nav>
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
