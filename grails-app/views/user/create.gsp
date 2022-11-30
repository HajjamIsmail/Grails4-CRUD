<!DOCTYPE html>
<html>
<head>
    <title>Simple CRUD - User</title>
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
            <span class="col-sm pb-4">New User Details</span>
        </h1>
        <div class="mt-5 card card-body bg-light">
            <form action="/user/save" class="form" method="post">
                <g:hasErrors bean="${this.user}">
                    <div class="alert alert-danger">
                        <ul>
                            <g:eachError bean="${this.user}" var="error">
                                <li><g:message error="${error}"/></li>
                            </g:eachError>
                        </ul>
                    </div>
                </g:hasErrors>
                <div class="row">
                    <div class="form-group col-6">
                        <label>Id</label>
                        <label class="label-control" type="text" name="id" value="${user?.id}"></label>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-6">
                        <label>First Name</label>
                        <input class="form-control" type="text" name="firstName" value="${user?.firstName}"/>
                    </div>
                    <div class="form-group col-6">
                        <label>Last Name</label>
                        <input class="form-control" type="text" name="lastName" value="${user?.lastName}"/>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-6">
                        <label>Email Address</label>
                        <input class="form-control" type="email" name="emailAddress" value="${user?.emailAddress}"/>
                    </div>
                    <div class="form-group col-6">
                        <label>Phone Number</label>
                        <input class="form-control" type="tel" name="phoneNumber" value="${user?.phoneNumber}"/>
                    </div>
                    <div class="form-group col-6">
                        <label>Password</label>
                        <input class="form-control" type="password" name="password" value="${user?.password}"/>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <button type="submit" class="btn btn-success btn-block">Create User</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
