<%-- 
    Document   : home
    Created on : 5 Jun 2024, 10:23:52 AM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Stardos Stencil">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" >
        <link rel="stylesheet" href="css/general.css">

        <style>
            .intro {
                position: relative;
                height: 50vh;
                overflow: hidden;
                text-align: center;
                color: black;
                background-image: url("images/sport.jpg");
                background-size: cover;
                background-position: center;
                background-repeat: no-repeat;
                opacity: 0.75;
                z-index: 0;
            }

            .intro h1, .intro p {
                position: absolute;
                left: 50%;
                transform: translateX(-50%);
                z-index: 1;
            }


            .intro h1 {
                top: 30%;
                width: 100%;
                font-size: 3em;
            }

            .intro p {
                top: 50%;
                font-size: 2em;
            }
            .info {
                padding: 20px;
                text-align: center;
            }
            .info h1 {
                margin-top: 0;
                font-size: 30px;
                color:#127a87;
            }
            .info p {
                margin-top: 0;
                font-size: 15px;
                color: #314A48
            }
            .equipment-container {
                display: flex;
                justify-content: space-between;
                margin-top: 20px;
                margin:3% 2% 0% 2%;
            }

            .equipment {
                width: 24%;
                margin-bottom: 20px;
                position: relative;
                overflow: hidden;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                transition: transform 0.3s ease;
                margin-bottom: 70px;
                background-color: white;
            }

            .equipment:hover {
                transform: translateY(-5px);
                box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            }

            .equipment img {
                width: 100%;
                height: auto;
                display: block;
            }

            .equipment-content {
                padding: 15px;
                background-color: white;
                text-align: left;
            }

            .equipment-title {
                font-size: 1.5em;
                font-weight: bold;
                margin-bottom: 10px;
                color: #333;
            }

            .equipment-description {
                font-size: 13px;
                line-height: 1.5;
                color: #555;
            }

            .program-icon {
                position: absolute;
                top: 10px;
                right: 10px;
                color: #fff;
                background-color: #007bff;
                padding: 5px 10px;
                border-radius: 50%;
                font-size: 1.2em;
                transition: background-color 0.3s ease;
            }

            .equipment:hover .equipment-icon {
                background-color: #0056b3;
            }

            @media screen and (max-width: 768px) {
                .equipment-container {
                    flex-wrap: wrap;
                    justify-content: space-around;
                }

                .equipment {
                    width: 45%; 
                    margin: 2%; 
                }
            }
            @media screen and (max-width: 480px) {
                .equipment {
                    width: 80%;
                    margin: 2% auto;
                }
            }
        </style>
    </head>
    <header>
        <%@include file="header.jsp"%>
    </header>
    <body>
        <div id="section">
            <div class="intro">
                <h1>Welcome to BorrowPlay</h1>
                <p>Be Active and Healthy</p>
            </div>
            <div class="info">
                <h1>Borrow Sports Equipment</h1>
                <br>
                <p>BorrowPlay offers a wide range of sports gear through an online catalog and reservation platform. Our system promotes 
                    convenient access to sports equipment, encourages physical activity, and optimizes resource utilization. Exercise is the key not only to
                    physical health but to peace of mind.</p>
            </div>
            <div class="equipment-container">
                <div class="equipment">
                    <img src="images/bolaTampar.jpg" alt="bola tampar">
                    <div class="equipment-content">
                        <!--                    <div class="program-icon">
                                                <i class="fas fa-graduation-cap"></i>
                                            </div>-->
                        <h2 class="equipment-title">Volleyball</h2>
                        <p class="equipment-description">
                            Game played by two teams, usually of six players on a side, 
                            in which the players use their hands to bat a ball back and forth over a high net, 
                            trying to make the ball touch the court within the opponents’ playing area before it can be returned.
                        </p>
                    </div>
                </div>

                <div class="equipment">
                    <img src="images/tennis.jpg" alt="tennis">
                    <div class="equipment-content">
                        <!--                    <div class="program-icon">
                                                <i class="fas fa-graduation-cap"></i>
                                            </div>-->
                        <h2 class="equipment-title">Tennis</h2>
                        <p class="equipment-description">
                            A racket sport that is played either individually against a 
                            single opponent (singles) or between two teams of two players 
                            each (doubles).
                        </p>
                    </div>
                </div>

                <div class="equipment">
                    <img src="images/bolaKeranjang.jpg" alt="bola keranjang">
                    <div class="equipment-content">
                        <!--                    <div class="program-icon">
                                                <i class="fas fa-graduation-cap"></i>
                                            </div>-->
                        <h2 class="equipment-title">Basketball</h2>
                        <p class="equipment-description">
                            Game played between two teams of five players each on a rectangular court, usually indoors. 
                            Each team tries to score by tossing the ball through the opponent’s goal, 
                            an elevated horizontal hoop and net called a basket.
                        </p>
                    </div>
                </div>

                <div class="equipment">
                    <img src="images/badminton.jpg" alt="badminton">
                    <div class="equipment-content">
                        <!--                    <div class="program-icon">
                                                <i class="fas fa-graduation-cap"></i>
                                            </div>-->
                        <h2 class="equipment-title">Badminton</h2>
                        <p class="equipment-description">
                            A racquet sport played using racquets to hit a shuttlecock across a net. 
                            Although it may be played with larger teams, the most common forms of the 
                            game are "singles" (with one player per side) and "doubles" (with two players per side).
                        </p>
                    </div>
                </div>
            </div>  
        </div>
        <footer>
            <%@include file="footer.jsp"%>
        </footer>
    </body>
</html>


