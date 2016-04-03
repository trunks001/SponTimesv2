<%-- 
    Document   : readarticle
    Created on : 29 Mar 2016, 5:55:20 PM
    Author     : Bones
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
      <script src="//cdn.tinymce.com/4/tinymce.min.js"></script>
      <script>
        tinymce.init({
            selector: 'textarea',
            height: 500,
            theme: 'modern',
            plugins: [
              'advlist autolink lists link image charmap print preview hr anchor pagebreak',
              'searchreplace wordcount visualblocks visualchars code fullscreen',
              'insertdatetime media nonbreaking save table contextmenu directionality',
              'emoticons template paste textcolor colorpicker textpattern imagetools'
            ],
            toolbar1: 'insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image',
            toolbar2: 'print preview media | forecolor backcolor emoticons',
            toolbar3: 'save | savearticle | publish',
            setup: function (editor) {
                editor.addButton('savearticle', {
                    text: 'Save Article',
                    icon: false,
                    onclick: function () {
                        editor.insertContent('&nbsp;<b>SAVED</b>&nbsp;');
                    }
                });
                editor.addButton('publish', {
                    text: 'Publish Article',
                    icon: false,
                    onclick: function () {
                        editor.insertContent('&nbsp;<b>PUBLISHED</b>&nbsp;');
                    }
                });
            },
            image_advtab: true,
            templates: [
              { title: 'Test template 1', content: 'Test 1' },
              { title: 'Test template 2', content: 'Test 2' }
            ],
            content_css: [
              '//fast.fonts.net/cssapi/e6dc9b99-64fe-4292-ad98-6974f93cd2a2.css',
              '//www.tinymce.com/css/codepen.min.css'
            ]
         });
      </script>
    </head>
    <body>
        <header class="intro">
            <div class="intro-body">
                <div class="container">
                    <%@include file="Spon_Times_NavBar.jsp"  %>
                    <textarea style="height: 100%">Edit your article here!</textarea>
                </div>
            </div>
        </header>
    </body>
</html>