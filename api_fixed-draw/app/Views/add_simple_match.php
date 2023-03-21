<?php include("layouts/head.php") ?>

<body>
    <!-- ============================================================== -->
    <!-- Preloader - style you can find in spinners.css -->
    <!-- ============================================================== -->
    <div class="preloader">
        <div class="lds-ripple">
            <div class="lds-pos"></div>
            <div class="lds-pos"></div>
        </div>
    </div>
    <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- ============================================================== -->
    <div id="main-wrapper" data-layout="vertical" data-navbarbg="skin5" data-sidebartype="full" data-sidebar-position="absolute" data-header-position="absolute" data-boxed-layout="full">
        <!-- ============================================================== -->
        <!-- Topbar header - style you can find in pages.scss -->
        <!-- ============================================================== -->
        <?php include("layouts/header.php") ?>
        <!-- ============================================================== -->
        <!-- End Topbar header -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
        <?php include("layouts/sidebar.php") ?>
        <!-- ============================================================== -->
        <!-- End Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Page wrapper  -->
        <!-- ============================================================== -->
        <div class="page-wrapper">
            <!-- ============================================================== -->
            <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <div class="page-breadcrumb bg-white">
                <div class="row align-items-center">
                    <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                        <h4 class="page-title">Ajout des matchs SIMPLES</h4>
                    </div>
                    <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                        <div class="d-md-flex">

                        </div>
                    </div>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- ============================================================== -->
            <!-- End Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- Container fluid  -->
            <!-- ============================================================== -->
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-7 col-lg-7 col-sm-7">
                    <?php if((session()->getFlashdata('success'))) : ?>
                        <div class="alert alert-success alert-dismissible fade show" role="alert">
                            <?=session()->getFlashdata('success');?>
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    <?php endif ?>
                    <?php if((session()->getFlashdata('danger'))) : ?>
                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                            <?=session()->getFlashdata('danger');?>
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    <?php endif ?>
                        <div class="white-box">
                            <form class="row g-3" method="POST" action="MatchController/addSimpleMatch">
                                <div class="col-md-12">
                                    <label for="domicile" class="form-label">Equipe Domicile</label>
                                    <input type="text" required class="form-control" id="domicile" name="domicile" placeholder="Barcelone">
                                </div>
                                <div class="col-md-12">
                                    <label for="exterieur" class="form-label">Equipe Exterieur</label>
                                    <input type="text" required class="form-control" id="exterieur" name="exterieur" placeholder="Real de madrid">
                                </div>
                                <div class="col-md-6">
                                <label for="pronostic" class="form-label">Pronostic</label>
                                    <select class="form-control" required id="pronostic" name="pronostic">
                                        <optgroup label="1X2">
                                            <option value="V1">V1</option>
                                            <option value="V2">V2</option>
                                            <option value="X">X</option>
                                            <option value="1X">1X</option>
                                            <option value="2X">2X</option>
                                            <option value="12">12</option>
                                        </optgroup>
                                       <optgroup label="Mi-temps fin">
                                            <option value="HT:X">HT:X</option>
                                            <option value="FT:X">FT:X</option>
                                            <option value="X/X">X/X</option>
                                            <option value="V1/V1">V1/V1</option>
                                            <option value="V2/V2">V2/V2</option>
                                            <option value="X/V1">X/V1</option>
                                            <option value="X/V2">X/V2</option>
                                            <option value="V1/V2">V1/V2</option>
                                            <option value="V1/X">V1/X</option>
                                            <option value="V2/X">V2/X</option>
                                       </optgroup>
                                       <optgroup label="Nombre de but dans le match">
                                            <option value="+1.5">+1.5</option>
                                            <option value="-1.5">-1.5</option>
                                            <option value="+2.5">+2.5</option>
                                            <option value="-2.5">-2.5</option>
                                            <option value="+3.5">+3.5</option>
                                            <option value="-3.5">-3.5</option>
                                            <option value="+4.5">+4.5</option>
                                            <option value="-4.5">-4.5</option>
                                       </optgroup>
                                       <optgroup label="Les 2 equipes marquent">
                                            <option value="GG / YES">GG / YES</option>
                                            <option value="GG / NO">GG / NO</option>
                                       </optgroup>
                                    </select>
                                </div>
                                <div class="col-md-12">
                                    <label for="date" class="form-label">Date du match</label>
                                    <input type="date" required class="form-control" value="<?=date("Y-m-d")?>" id="date" name="date">
                                </div>
                                <div class="col-12">
                                    <button type="submit" class="btn btn-primary">Enregistrer</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- footer -->
            <!-- ============================================================== -->
            <?php include("layouts/footer.php") ?>