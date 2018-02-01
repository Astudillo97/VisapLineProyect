<%@ Page Title="" Language="C#" MasterPageFile="~/View/Private/Admin.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="VisapLine.View.Private.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="content-header">
        <h1>Dashboard</h1>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#"><i class="fa fa-dashboard"></i>VisapLine</a></li>
        </ol>
    </section>
    <section class="content">
        <div class="col-lg-6">
            <div class="box">
                <div class="box-header with-border">
                    <h3 class="box-title">FLORENCIA CAQUETÁ, COLOMBIA </h3>
                </div>
                <div class="box-body">
                    <img class="img-fluid" src="../../Contenido/images/florencia2.jpg" alt="..." />
                </div>
                <!-- /.box-body -->
                <div class="box-footer">
                    <div class="row align-items-center">
                        <div class="col-lg-4 col-md-5">
                            <div class="row">
                                <div class="col-4">
                                    <div>
                                        <h1><i class="wi-day-sunny"></i></h1>
                                    </div>
                                </div>
                                <div class="col-8">
                                    <span class="font-size-40">20°
							<span class="font-size-30">C</span>
                                    </span>
                                    <span class="font-size-18">/</span>
                                    <span class="font-size-18">7°
							<span class="font-size-16">C</span>
                                    </span>
                                    <p class="font-size-14 mb-0">MONDAY 11.11.2017</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-8 col-md-7">
                            <div class="row no-space text-center">
                                <div class="col-2">
                                    <div class="weather-day vertical-align">
                                        <div class="vertical-align-middle font-size-16">
                                            <div class="mb-10">TUE</div>
                                            <i class="wi-day-sunny font-size-24 mb-10"></i>
                                            <div>
                                                24°
								<span class="font-size-12">C</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-2">
                                    <div class="weather-day vertical-align">
                                        <div class="vertical-align-middle font-size-16">
                                            <div class="mb-10">WED</div>
                                            <i class="wi-day-cloudy font-size-24 mb-10"></i>
                                            <div>
                                                21°
								<span class="font-size-12">C</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-2">
                                    <div class="weather-day vertical-align">
                                        <div class="vertical-align-middle font-size-16">
                                            <div class="mb-10">THU</div>
                                            <i class="wi-day-sunny font-size-24 mb-10"></i>
                                            <div>
                                                25°
								<span class="font-size-12">C</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-2">
                                    <div class="weather-day vertical-align">
                                        <div class="vertical-align-middle font-size-16">
                                            <div class="mb-10">FRI</div>
                                            <i class="wi-day-cloudy-gusts font-size-24 mb-10"></i>
                                            <div>
                                                20°
								<span class="font-size-12">C</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-2">
                                    <div class="weather-day vertical-align">
                                        <div class="vertical-align-middle font-size-16">
                                            <div class="mb-10">SAT</div>
                                            <i class="wi-day-lightning font-size-24 mb-10"></i>
                                            <div>
                                                18°
								<span class="font-size-12">C</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-2">
                                    <div class="weather-day vertical-align">
                                        <div class="vertical-align-middle font-size-16">
                                            <div class="mb-10">SUN</div>
                                            <i class="wi-day-storm-showers font-size-24 mb-10"></i>
                                            <div>
                                                14°
								<span class="font-size-12">C</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.box-footer-->
            </div>
        </div>


        <div class="row">
            <div class="col-xl-3 col-md-6 col">
                <div class="info-box bg-aqua">
                    <span class="info-box-icon push-bottom"><i class="ion ion-ios-pricetag-outline"></i></span>

                    <div class="info-box-content">
                        <span class="info-box-text">New Clients</span>
                        <span class="info-box-number">450</span>

                        <div class="progress">
                            <div class="progress-bar" style="width: 45%"></div>
                        </div>
                        <span class="progress-description">45% Increase in 28 Days
                        </span>
                    </div>
                    <!-- /.info-box-content -->
                </div>
                <!-- /.info-box -->
            </div>
            <!-- /.col -->
            <div class="col-xl-3 col-md-6 col">
                <div class="info-box bg-green">
                    <span class="info-box-icon push-bottom"><i class="ion ion-ios-eye-outline"></i></span>

                    <div class="info-box-content">
                        <span class="info-box-text">Total Visits</span>
                        <span class="info-box-number">15,489</span>

                        <div class="progress">
                            <div class="progress-bar" style="width: 40%"></div>
                        </div>
                        <span class="progress-description">40% Increase in 28 Days
                        </span>
                    </div>
                    <!-- /.info-box-content -->
                </div>
                <!-- /.info-box -->
            </div>
            <!-- /.col -->
            <div class="col-xl-3 col-md-6 col">
                <div class="info-box bg-purple">
                    <span class="info-box-icon push-bottom"><i class="ion ion-ios-cloud-download-outline"></i></span>

                    <div class="info-box-content">
                        <span class="info-box-text">Downloads</span>
                        <span class="info-box-number">55,005</span>

                        <div class="progress">
                            <div class="progress-bar" style="width: 85%"></div>
                        </div>
                        <span class="progress-description">85% Increase in 28 Days
                        </span>
                    </div>
                    <!-- /.info-box-content -->
                </div>
                <!-- /.info-box -->
            </div>
            <!-- /.col -->
            <div class="col-xl-3 col-md-6 col">
                <div class="info-box bg-red">
                    <span class="info-box-icon push-bottom"><i class="ion-ios-chatbubble-outline"></i></span>

                    <div class="info-box-content">
                        <span class="info-box-text">Direct Chat</span>
                        <span class="info-box-number">13,921</span>

                        <div class="progress">
                            <div class="progress-bar" style="width: 50%"></div>
                        </div>
                        <span class="progress-description">50% Increase in 28 Days
                        </span>
                    </div>
                    <!-- /.info-box-content -->
                </div>
                <!-- /.info-box -->
            </div>
            <!-- /.col -->
        </div>


        <div class="row">
            <div class="col-xl-3 col-md-6 col-6">
                <!-- small box -->
                <div class="small-box bg-aqua">
                    <div class="inner">
                        <h3>255</h3>

                        <p>New Orders</p>
                    </div>
                    <div class="icon">
                        <i class="fa fa-shopping-bag"></i>
                    </div>
                    <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-right"></i></a>
                </div>
            </div>
            <!-- ./col -->
            <div class="col-xl-3 col-md-6 col-6">
                <!-- small box -->
                <div class="small-box bg-green">
                    <div class="inner">
                        <h3>67<sup style="font-size: 20px">%</sup></h3>

                        <p>Sales Rate</p>
                    </div>
                    <div class="icon">
                        <i class="fa fa-bar-chart"></i>
                    </div>
                    <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-right"></i></a>
                </div>
            </div>
            <!-- ./col -->
            <div class="col-xl-3 col-md-6 col-6">
                <!-- small box -->
                <div class="small-box bg-purple">
                    <div class="inner">
                        <h3>78</h3>

                        <p>Registrations</p>
                    </div>
                    <div class="icon">
                        <i class="fa fa-user-plus"></i>
                    </div>
                    <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-right"></i></a>
                </div>
            </div>
            <!-- ./col -->
            <div class="col-xl-3 col-md-6 col-6">
                <!-- small box -->
                <div class="small-box bg-red">
                    <div class="inner">
                        <h3>65</h3>
                        <p>New Visitors</p>
                    </div>
                    <div class="icon">
                        <i class="fa fa-pie-chart"></i>
                    </div>
                    <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-right"></i></a>
                </div>
            </div>
            <!-- ./col -->
        </div>







    </section>

</asp:Content>
