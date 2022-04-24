<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Login</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://kit.fontawesome.com/1ec3eb69b6.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="login.js"></script>
</head>

<body>
<div class="container">
    <div class="row">
        <div class="col-sm-4"></div>
        <div class="col-sm-4">
            <div class="card my-5">
                <div class="card-header mb-3">Please Sign In</div>
                <form class="px-3" action="<%=request.getContextPath()%>/login" method="post">
                    <div class="text-danger text-center" role="alert">
                        <p>${NOTI}</p>
                    </div>
                    <input type="text" id="account" name="account" class="form-control mb-3"
                           value="${rememberUsername}" placeholder="Account" required>
                    <input type="password" id="psw" name="psw" class="form-control mb-3" placeholder="Password"
                           required>
                    <div class="form-check mb-3">
                        <input class="form-check-input" type="checkbox" value="yes" id="remember" name="remember"
                        ${rmbCheck=="yes" ? 'checked':''}>
                        <label class="form-check-label" for="remember">
                            Remember Me
                        </label>
                    </div>
                    <button class="btn btn-success btn-block mb-3" type="submit">Login</button>
                    </a>
                </form>
            </div>
        </div>
        <div class="col-sm-4"></div>
    </div>
</div>
</body>

</html>
