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
                    Parking lot manager
                </a>
            </li>
            <div id="abc" class="">
                <ul class="list-group list-group-flush">
                    <li class="list-group-item border-bottom-0 bg-light">
                        <a href="${pageContext.request.contextPath}/listParkingLot" class="ms-3 nav-link link-primary">
                            <i class="fas fa-list"></i>
                            Parking lot list
                        </a>
                    </li>
                    <li class="list-group-item border-bottom bg-light">
                        <a href="${pageContext.request.contextPath}/addParkingLot" class="ms-3 nav-link link-primary">
                            <i class="fas fa-plus"></i>
                            Add parking lot
                        </a>
                    </li>
                </ul>
            </div>
        </ul>
    </div>
</div>