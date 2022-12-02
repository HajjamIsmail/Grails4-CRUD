<!DOCTYPE html>
<html>
<head>
    <title>Simple CRUD - Annonce</title>
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
        <span class="col-sm pb-4">New Annonce Details</span>
    </h1>
    <div class="mt-5 card card-body bg-light">
        <form action="/annonce/save" class="form" method="post">
            <g:hasErrors bean="${this.annonce}">
                <div class="alert alert-danger">
                    <ul>
                        <g:eachError bean="${this.annonce}" var="error">
                            <li><g:message error="${error}"/></li>
                        </g:eachError>
                    </ul>
                </div>
            </g:hasErrors>
            <div class="row">
                <div class="form-group col-6">
                    <label>Id</label>
                    <label class="label-control" type="text" name="id" value="${annonce?.id}"></label>
                </div>
            </div>
            <div class="row">
                <div class="form-group col-6">
                    <label>Title</label>
                    <input class="form-control" type="text" name="title" value="${annonce?.title}"/>
                </div>
                <div class="form-group col-6">
                    <label>Description</label>
                    <input class="form-control" type="text" name="description" value="${annonce?.description}"/>
                </div>
            </div>
            <div class="row">
                <div class="form-group col-6">
                    <label>Price</label>
                    <input class="form-control" type="number" name="price" value="${annonce?.price}"/>
                </div>
                <div class="form-group col-6">
                    <label>isActive</label>
                    <input class="form-control" type="checkbox" name="isActive" value="${annonce?.isActive}"/>
                </div>
                <div class="form-group col-6">
                    <label>Date Created</label>
                    <input class="form-control" type="date" name="dateCreated" value="${annonce?.dateCreated}"/>
                </div>
                <div class="form-group col-6">
                    <label>Last Updated</label>
                    <input class="form-control" type="date" name="lastUpdated" value="${annonce?.lastUpdated}"/>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <button type="submit" class="btn btn-success btn-block">Create Annonce</button>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>
