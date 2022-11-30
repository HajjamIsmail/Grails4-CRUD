<!DOCTYPE html>
<html>
<head>
    <title>Simple CRM - User Management made Simple</title>

    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css" rel="stylesheet"
          crossorigin="anonymous">

</head>
<body>
    <nav class="navbar navbar-dark bg-dark fixed-top">
        <div class="container">
            <div class="navbar-header">
                <a class="navbar-brand" href="/">Simple CRUD</a>
            </div>
        </div>
    </nav>
    <div class="container" style="margin-top:80px">
        <h1 class="pb-2 border-bottom row">
            <span class="col-sm-6 pb-4">User: </span>
            <span class="col-sm-6 text-sm-right pb-4">
                <form action="/user/delete?" method="post" onsubmit="return confirm('Are you sure?');">
                    <input type="hidden" name="id" value="${user?.id}"/>
                    <button class="btn btn-danger btn-outline-danger d-block d-sm-inline-block">Delete User</button>
                </form>
            </span>
        </h1>

        <div class="mt-5 card card-body bg-light">
            <form action="/user/update?" class="form" method="post">
                <input type="hidden" name="id" value="${user?.id}"/>
                <g:hasErrors bean="${user}">
                    <div class="alert alert-danger">
                        <ul>
                            <g:eachError bean="${user}" var="error">
                                <li><g:message error="${error}"/></li>
                            </g:eachError>
                        </ul>
                    </div>
                </g:hasErrors>
                <div class="row">
                    <div class="form-group col-6">
                        <label>ID</label>
                        <label>${user?.id}</label>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-6">
                        <label>First Name</label>
                        <input class="form-control" name="firstName" value="${user?.firstName}"/>
                    </div>
                    <div class="form-group col-6">
                        <label>Last Name</label>
                        <input class="form-control" name="lastName" value="${user?.lastName}"/>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-6">
                        <label>Email Address</label>
                        <input class="form-control" name="emailAddress" value="${user?.emailAddress}"/>
                    </div>
                    <div class="form-group col-6">
                        <label>Phone Number</label>
                        <input class="form-control" name="phoneNumber" value="${user?.phoneNumber}"/>
                    </div>
                    <div class="form-group col-6">
                        <label>New Password</label>
                        <input class="form-control" type="password" name="password" value="${user?.password}"/>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <button type="submit" class="btn btn-success btn-block">Save Changes</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <footer class="footer navbar-dark bg-dark fixed-bottom">
        <div class="container">
            <div class="row">
                <div class="col-md-4"></div>
                <div class="col-md-4">
                    <p class="text-center text-muted">&copy;
                        <span>${formatDate(date: new Date(), format:'yyyy')}</span>
                        <a href="https://tucanoo.com">Tucanoo Solutions Ltd.</a>
                    </p>
                </div>
            </div>
        </div>
    </footer>
</body>
</html>
