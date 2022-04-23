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
  <title>Ticket view</title>
</head>

<body>
<div class="container-fluid">
  <!--NAVBAR-->
  <div class="row">
    <div class="col-2 px-0">
      <li class="list-group-item bg-light border-end-0 border-top-0 border-start-0">
        <a class="nav-link text-secondary text-decoration-none" href="#">
          <i class="fas fa-ticket-alt"></i>
          Ticket
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
              <i class="fas fa-ticket-alt"></i>
              Ticket manager
            </a>
          </li>
          <div id="abc" class="">
            <ul class="list-group list-group-flush">
              <li class="list-group-item border-bottom-0 bg-light">
                <a href="${pageContext.request.contextPath}/ticket-list" class="ms-3 nav-link link-primary">
                  <i class="fas fa-list"></i>
                  Ticket list
                </a>
              </li>
              <li class="list-group-item border-bottom bg-light">
                <a href="${pageContext.request.contextPath}/ticket-add" class="ms-3 nav-link link-primary">
                  <i class="fas fa-plus"></i>
                  Add Ticket
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
        <p class="h2 fw-normal mb-3">Add Ticket <c:if test="${requestScope.message ne null}"><span class="text-danger">${requestScope.message}</span></c:if></p>
        <hr>
      </div>

      <div class="pt-5 ps-5 pe-5">
        <div class="">
          <!--ADD CODE HERE-->
          <form action="${pageContext.request.contextPath}/ticket-add" method="post">
            <div class="row mb-3">
              <div class="col-2">
                <label class="fw-bold" role="button" for="txtCustomer">
                  <span>Customer </span>
                  <span class="text-danger">(*)</span>
                </label>
              </div>
              <div class="col-5">
                <input type="text" class="form-control" id="txtCustomer" name="txtCustomer"
                       placeholder="Enter customer name" value="${requestScope.ticket.customerName}">
              </div>
            </div>
            <div class="row mb-3">
              <div class="col-2">
                <label class="fw-bold" role="button" for="txtBookingTime">
                  <span>Booking time </span>
                  <span class="text-danger">(*)</span>
                </label>
              </div>
              <div class="col-5">
                <input type="time" class="form-control" id="txtBookingTime"
                       name="txtBookingTime" placeholder="--:-- --" value="${requestScope.ticket.bookingTime}">
              </div>
            </div>
            <div class="row mb-3">
              <div class="col-2">
                <label class="fw-bold" role="button" for="txtTrip">
                  <span>Trip </span>
                  <span class="text-danger">(*)</span>
                </label>
              </div>
              <div class="col-5">
                <c:choose>
                  <c:when test="${requestScope.tripList.size() != 0}">
                    <select id="txtTrip" name="txtTrip" class="form-select">
                    <c:forEach items="${requestScope.tripList}" var="trip">
                        <option value="${trip.tripId}">${trip.destination}</option>
                    </c:forEach>
                    </select>
                  </c:when>
                  <c:otherwise>
                    <span class="fw-bold text-danger">There is no trip left!</span>
                  </c:otherwise>
                </c:choose>
              </div>
            </div>
            <div class="row mb-3">
              <div class="col-2">
                <label class="fw-bold" role="button" for="txtLicensePlate">
                  <span>License plate </span>
                  <span class="text-danger">(*)</span>
                </label>
              </div>
              <div class="col-5">
                <input type="text" class="form-control" id="txtLicensePlate" name="txtLicensePlate"
                       placeholder="Enter car type" value="${requestScope.ticket.licensePlate}">
              </div>
            </div>
            <div class="row mb-3">
              <div class="col-7 text-center">
                <button type="reset" class="btn btn-warning"><i class="fas fa-undo"></i>
                  Reset</button>
                <button type="submit" class="btn btn-success"><i class="fas fa-plus"></i>
                  Add</button>
                <input type="hidden" name="ticketId" value="${requestScope.ticket.ticketId}">
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