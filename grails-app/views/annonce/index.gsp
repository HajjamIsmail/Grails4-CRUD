<!DOCTYPE html>
<html>
<head>
    <title>Simple CRM - Annonce Management made Simple</title>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" type="text/css"/>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css" rel="stylesheet"
          crossorigin="anonymous">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"
          integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet"/>
    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>
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
        <span class="col-sm-6 pb-4">Annonce List</span>
        <span class="col-sm-6 text-sm-right pb-4">
            <a href="/Annonce/create" class="btn btn-primary btn-outline-primary d-block d-sm-inline-block">Create Annonce</a>
        </span>
    </h1>

    <g:if test="${flash.message}">
        <div class="alert alert-info">
            <h3>${flash.message}</h3>
        </div>
    </g:if>

    <div class="mt-5">
        <table id="annonceTable" class="table table-striped table-bordered" style="width:100%">
            <thead>
            <tr>
                <th>Id</th>
                <th>Title</th>
                <th>Description</th>
                <th>Price</th>
                <th>isActive</th>
                <!--<th>Password</th>-->
            </tr>
            </thead>
        </table>
    </div>

</div>
<footer class="footer navbar-dark bg-dark fixed-bottom">
    <div class="container">
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4">
                <p class="text-center text-muted">&copy;
                    <span>${formatDate(date: new Date(), format:'yyyy')}</span>
                    <a href="#">ISMAIL Solutions.</a>
                </p>
            </div>
        </div>
    </div>
</footer>

<script>
    var url = '/annonce/data_for_datatable';

    $(document).ready(function () {

        $('#annonceTable').DataTable({
            "ajax": url,
            "processing": true,
            "serverSide": true,
            "columns": [
                {
                    "data": "id",
                    "render": function (data, type, row, meta) {
                        return '<a href="/annonce/edit/' + row.id + '">' + data + '</a>';
                    }
                },
                {
                    "data": "title",
                    "render": function (data, type, row, meta) {
                        return '<a href="/annonce/edit/' + row.id + '">' + data + '</a>';
                    }
                },
                {
                    "data": "description",
                    "render": function (data, type, row, meta) {
                        return '<a href="/annonce/edit/' + row.id + '">' + data + '</a>';
                    }
                },
                {
                    "data": "price",
                    "render": function (data,type,row,meta){
                        return '<a href="/annonce/edit/' + row.id + '">' + data + '</a>';
                    }
                },
                {
                    "data": "isActive",
                    "render": function (data,type,row,meta){
                        return '<a href="/annonce/edit/' + row.id + '">' + data + '</a>';
                    }
                }
            ]
        });
    });
</script>
</body>
</html>