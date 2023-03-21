<footer class="footer text-center">Copyright Fixed Draw © 2022 - Designed by Braincode
</footer>
<!-- ============================================================== -->
<!-- End footer -->
<!-- ============================================================== -->
</div>
<!-- ============================================================== -->
<!-- End Page wrapper  -->
<!-- ============================================================== -->
</div>
<!-- ============================================================== -->
<!-- End Wrapper -->
<!-- ============================================================== -->
<!-- ============================================================== -->
<!-- All Jquery -->
<!-- ============================================================== -->
<script src="plugins/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap tether Core JavaScript -->
<script src="bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="js/app-style-switcher.js"></script>
<script src="plugins/bower_components/jquery-sparkline/jquery.sparkline.min.js"></script>
<!--Wave Effects -->
<script src="js/waves.js"></script>
<!--Menu sidebar -->
<script src="js/sidebarmenu.js"></script>
<!--Custom JavaScript -->
<script src="js/custom.js"></script>
<!--This page JavaScript -->
<!--chartis chart-->
<script src="plugins/bower_components/chartist/dist/chartist.min.js"></script>
<script src="plugins/bower_components/chartist-plugin-tooltips/dist/chartist-plugin-tooltip.min.js"></script>
<script src="js/pages/dashboards/dashboard1.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
    $('#pass').submit(function(event) {
        event.preventDefault();
        var a = "";
        $.ajax({
            url: "MatchController/genererPass",
            method: "POST",
            cache: false,
            processData: false,
            success: function(data) {
                console.log(data)
                $('#pass_g').val(data);
                $('#donne').html('<tr>\
                                <td>Code:</td>\
                                <td id="code"><span class="badge rounded-pill bg-warning">' + data + '</span></td>\
                            </tr>\
                            <tr>\
                                <td>Validité:</td>\
                                <td id="valid">' + $("#validite").val() + ' Jours</td>\
                            </tr>')
                //  $('#valid').html($("#validite").val());
                $('#staticBackdrop').modal('show')
                navigator.clipboard.writeText(data)
                    .then(() => {
                        console.log("Text copied to clipboard...")
                    })
                    .catch(err => {
                        console.log('Something went wrong', err);
                    })
            },
            error: function(data) {
                alert('Une erreur est survenue')
            }
        });
    })
</script>
<script>
    $('#activation').click(function(event) {
        var data = {
            'pass': $('#pass_g').val(),
            'validite': $('#validite').val(),
        };
        console.log(data);
        $.ajax({
            url: "MatchController/activerPass",
            method: "POST",
          
            data: data,

            success: function(data) {
                console.log(data)
                alert("operation reussi et le pass d'accès à été copié dans le presse papier")
                window.location.reload();
            },
            error: function(data) {
                alert('Une erreur est survenue')
            }
        });
    })
</script>

</body>

</html>