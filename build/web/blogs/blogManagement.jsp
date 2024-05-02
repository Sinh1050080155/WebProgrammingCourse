<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Blog Management</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <style>
            .blog-card {
                margin-bottom: 20px;
                position: relative;
            }
            .id-blog {
                position: absolute;
                top: 0;
                left: 0;
                background-color: rgba(255,255,255,0.8);
                padding: 2px 5px;
                font-size: 1em;
                border-top-left-radius: 4px;
                border-bottom-right-radius: 4px;
            }
            .blog-card img {
                max-height: 200px;
                object-fit: cover;
            }
            .blog-description {
                overflow: hidden;
                text-overflow: ellipsis;
                display: -webkit-box;
                -webkit-line-clamp: 3;
                -webkit-box-orient: vertical;
            }
            .blog-actions {
                margin-top: 10px;
            }
        </style>

    </head>
    <body>

        <div class="container mt-5">
            <h2>Blog Management</h2>
            <div class="mb-3">
                <button type="button" class="btn btn-success" data-toggle="modal" data-target="#addBlogModal">Add New Blog</button>
            </div>
            <div class="row">
                <c:forEach items="${blogManagement}" var="blog">
                    <div class="col-md-4 blog-card">
                        <div class="card">
                            <span class="id-blog">${blog.id}</span>
                            <img src="${blog.img}" class="card-img-top" alt="${blog.name}">
                            <div class="card-body">
                                <h5 class="card-title">${blog.name}</h5>
                                <p class="card-text blog-description">${blog.description}</p>
                                
                                <div class="blog-actions">

                                    <button class="btn btn-primary edit-blog" 
                                            data-toggle="modal" 
                                            data-target="#editBlogModal"
                                            data-blog-id="${blog.id}" 
                                            data-blog-name="${blog.name}" 
                                            data-blog-description="${blog.description}" 
                                            data-blog-img="${blog.img}">
                                        Edit
                                    </button>


                                    <button class="btn btn-danger delete-blog" data-blog-id="${blog.id}">Delete</button>

                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>

        <div class="modal fade" id="addBlogModal" tabindex="-1" aria-labelledby="addBlogModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addBlogModalLabel">Add New Blog</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="addBlogForm">
                            <div class="form-group">
                                <label for="blogId">Blog ID</label>
                                <input type="text" class="form-control" id="blogId" name="id">
                            </div>
                            <div class="form-group">
                                <label for="blogName">Blog Name</label>
                                <input type="text" class="form-control" id="blogName" name="name">
                            </div>
                            <div class="form-group">
                                <label for="blogDescription">Description</label>
                                <textarea class="form-control" id="blogDescription" name="description"></textarea>
                            </div>
                            <div class="form-group">
                                <label for="blogImg">Image</label>
                                <input type="file" class="form-control-file" id="blogImg" name="img">
                                <img id="imgPreview" src="#" alt="Image Preview" style="max-width: 100%; height: auto; margin-top: 10px; display: none;">
                            </div>

                            
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" id="submitBlog">Save changes</button>
                    </div>
                </div>
            </div>
        </div>


        <div class="modal fade" id="editBlogModal" tabindex="-1" aria-labelledby="editBlogModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="editBlogModalLabel">Edit Blog</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="editBlogForm">
                            <input type="hidden" id="editBlogId" name="id">
                            <div class="form-group">
                                <label for="editBlogName">Blog Name</label>
                                <input type="text" class="form-control" id="editBlogName" name="name">
                            </div>
                            <div class="form-group">
                                <label for="editBlogDescription">Description</label>
                                <textarea class="form-control" id="editBlogDescription" name="description"></textarea>
                            </div>
                            <div class="form-group">
                                <label for="editBlogImg">Image</label>
                                <input type="file" class="form-control-file" id="editBlogImg" name="img">
                                <img id="imgPreview" src="#" alt="Image Preview" style="max-width: 100%; height: auto; margin-top: 10px; display: none;">
                            </div>

                            
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" id="editBlogSubmit">Save Changes</button>
                    </div>
                </div>
            </div>
        </div>





        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>


        <script>
            $(document).ready(function () {
                $('.delete-blog').on('click', function () {
                    var blogId = $(this).data('blog-id');
                    if (confirm('Are you sure you want to delete this blog?')) {
                        $.ajax({
                            url: 'DeleteBlogServlet',
                            type: 'POST',
                            data: {blogId: blogId},
                            success: function (response) {
                                alert('Blog deleted successfully');
                                location.reload();
                            },
                            error: function () {
                                alert('Error deleting blog');
                            }
                        });
                    }
                });
            });
        </script>

        <script>
            $(document).ready(function () {
                $('#submitBlog').click(function (e) {
                    e.preventDefault();
                    var formData = new FormData($('#addBlogForm')[0]);

                    $.ajax({
                        url: 'AddBlogServlet',
                        type: 'POST',
                        data: formData,
                        contentType: false,
                        processData: false,
                        success: function (response) {
                            alert(response);
                            location.reload();
                        },
                        error: function (xhr, status, error) {
                            alert('Error adding blog: ' + xhr.responseText);
                        }
                    });
                });

                document.getElementById("blogImg").onchange = function (event) {
                    var reader = new FileReader();
                    reader.onload = function () {
                        var imgPreview = document.getElementById('imgPreview');
                        imgPreview.src = reader.result;
                        imgPreview.style.display = "block";
                    };
                    reader.readAsDataURL(event.target.files[0]);
                };
            });




            $(document).ready(function () {
                $('.edit-blog').click(function () {
                   
                    var blogId = $(this).data('blog-id');
                    var blogName = $(this).data('blog-name');
                    var blogDescription = $(this).data('blog-description');
                    var blogImg = $(this).data('blog-img');
                    
                    $('#editBlogModal #editBlogId').val(blogId);
                    $('#editBlogModal #editBlogName').val(blogName);
                    $('#editBlogModal #editBlogDescription').val(blogDescription);
                    
                    $('#editBlogModal #imgPreview').attr('src', blogImg).show();

                   
                    $('#editBlogModal').modal('show');
                });

                $('#editBlogSubmit').click(function (e) {
                    e.preventDefault();
                    var formData = new FormData($('#editBlogForm')[0]);

                    $.ajax({
                        url: 'EditBlogServlet',
                        type: 'POST',
                        data: formData,
                        contentType: false, 
                        processData: false,
                        success: function (response) {
                            alert(response);
                            $('#editBlogModal').modal('hide'); 
                            location.reload(); 
                        },
                        error: function (xhr, status, error) {
                            alert('Error updating blog: ' + xhr.responseText);
                        }
                    });
                });
            });


        </script>

    </body>
</html>
