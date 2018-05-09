<style>
    form { display: block; margin: 20px auto;  border-radius: 10px; padding: 15px }
    .progress { position:relative; width:400px; border: 1px solid #ddd; padding: 1px; border-radius: 3px; }
    .bar { background-color: #B4F5B4; width:0%; height:20px; border-radius: 3px; }
    .percent { position:absolute; display:inline-block; top:3px; left:48%; }
    .container{ width: 400px }
    @keyframes spin {
        0% { transform: rotate(0deg); }
        100% { transform: rotate(360deg); }
    }

    .loader
    {
        border: 6px solid #ffffff; /* Light grey */
        border-top: 6px solid #3498db; /* Blue */
        border-radius: 50%;
        width: 40px;
        height: 40px;
        animation: spin 2s linear infinite;
        margin-left: auto;
        margin-right: auto;
    }
</style>
<script src="resources/js/jquery.form.js"></script>
<script src="resources/js/pace.min.js"></script>
<script>
    function _(el){
        return document.getElementById(el);
    }
    function uploadFile(){
        var inputFile = document.getElementById("id-input-file-3");
        var file = inputFile.files[0];
        var data = new FormData(document.getElementById("form-escaneo"));
        //data.append('archivo',file);
        $.ajax({
            url: 'leerExcel',
            type: 'POST',
            contentType: false,
            beforeSend: function () {
              var loader = document.getElementById("result");
              loader.innerHTML = "<div class='loader'></div>";
            },
            success: function (data) {
              var success = document.getElementById("result");
              success.innerHTML = data;
              var file_input = $('#id-input-file-3');
              file_input.ace_file_input('reset_input');
            },
            data:data,
            processData:false,
            cache:false,
            enctype: "multipart/form-data"
        });
    }

    $(document).ready(function () {
        $('#id-input-file-3').ace_file_input({
            style:'well',
            btn_choose:'Buscar Archivo',
            btn_change:null,
            no_icon:'icon-cloud-upload',
            droppable:true,
            thumbnail:'small'
            //,icon_remove:null//set null, to hide remove/reset button
            /**,before_change:function(files, dropped) {
						//Check an example below
						//or examples/file-upload.html
						return true;
					}*/
            /**,before_remove : function() {
						return true;
					}*/
            ,
            preview_error : function(filename, error_code) {
                //name of the file that failed
                //error_code values
                //1 = 'FILE_LOAD_FAILED',
                //2 = 'IMAGE_LOAD_FAILED',
                //3 = 'THUMBNAIL_FAILED'
                alert(error_code);
            }

        }).on('change', function(){
            console.log($(this).data('ace_input_files'));
            console.log($(this).data('ace_input_method'));
        });

        $('#id-file-format').removeAttr('checked').on('change', function() {
            var before_change;
            var btn_choose;
            var no_icon;
            if(this.checked) {
                btn_choose = "Drop images here or click to choose";
                no_icon = "icon-picture";
                before_change = function(files, dropped) {
                    var allowed_files = [];
                    for(var i = 0 ; i < files.length; i++) {
                        var file = files[i];
                        if(typeof file === "string") {
                            //IE8 and browsers that don't support File Object
                            if(! (/\.(jpe?g|png|gif|bmp)$/i).test(file) ) return false;
                        }
                        else {
                            var type = $.trim(file.type);
                            if( ( type.length > 0 && ! (/^image\/(jpe?g|png|gif|bmp)$/i).test(type) )
                                || ( type.length == 0 && ! (/\.(jpe?g|png|gif|bmp)$/i).test(file.name) )//for android's default browser which gives an empty string for file.type
                            ) continue;//not an image so don't keep this file
                        }

                        allowed_files.push(file);
                    }
                    if(allowed_files.length == 0) return false;

                    return allowed_files;
                }
            }
            else {
                btn_choose = "Drop files here or click to choose";
                no_icon = "icon-cloud-upload";
                before_change = function(files, dropped) {
                    return files;
                }
            }
            var file_input = $('#id-input-file-3');
            file_input.ace_file_input('update_settings', {'before_change':before_change, 'btn_choose': btn_choose, 'no_icon':no_icon})
            file_input.ace_file_input('reset_input');
        });
    });
</script>
<section class="container">
    <div class="widget-box">
        <div class="widget-header">
            <h4>Subir Archivo Plano</h4>
        </div>
        <div class="widget-body">
            <div class="widget-main">
                <form method="post"  id="form-escaneo">
                    <input type="file" name="archivo" multiple="" id="id-input-file-3" class="archivo"><br>
                    <!--input type="submit" value="Subir Archivo"-->
                    <button class="btn btn-info" type="button" onclick="uploadFile()">
                        <i class="icon-ok bigger-110"></i>
                        Subir Archivo
                    </button>
                    <h3 id="status"></h3>
                    <p id="loaded_n_total"></p>
                </form>
            </div>
        </div>
    </div>
    <div id="result">
        
    </div>
</section>
