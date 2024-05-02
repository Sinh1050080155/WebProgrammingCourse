
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Card Layout</title>
        <style>
            :root {
                --primary-color: #007bff;
                --bg-color-card: #f5f5f5;
                --btn-hover-color: #0056b3;
                --transition-speed: 0.3s;
            }

            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            .container {
                width: 100%;
                overflow: hidden;
                margin: 20px auto;
                position: relative;
            }

            .card-wrapper {
                display: flex;
                width: 960px; 
                overflow-x: auto;
                scroll-behavior: smooth;
                padding: 20px 0;
                box-sizing: border-box;
                margin: 0 auto;
            }

            .card {
                flex: 0 0 300px;
                margin: 0 10px;
                background-color: var(--bg-color-card);
                border-radius: 5px;
                box-shadow: 0 2px 5px rgba(0,0,0,0.2);
            }

            .thumbnail {
                background-color: #ddd;
                height: 200px;
            }

            .card-body p {
                padding: 15px;
                text-align: left;
            }

            .card-footer {
                padding: 10px 15px;
                text-align: left;
            }

            .btn {
                padding: 5px 10px;
                background-color: var(--primary-color);
                color: white;
                border: none;
                border-radius: 3px;
                cursor: pointer;
                transition: background-color var(--transition-speed);
            }

            .btn:hover {
                background-color: var(--btn-hover-color);
            }

            .time-info {
                float: right;
            }

            h2 {
                color: #333;
                text-align: center;
            }

            .scroll-btn {
                display: block; 
                position: absolute;
                top: 50%;
                transform: translateY(-50%);
                background-color: rgba(0, 0, 0, 0.5); 
                color: white;
                border: none;
                padding: 10px 20px;
                cursor: pointer;
                z-index: 10;
            }

            .left-arrow {
                left: 200px; 
            }

            .right-arrow {
                right: 200px; 
            }
            .card-wrapper {
                display: flex;
                width: 960px; 
                overflow-x: hidden;
                scroll-behavior: smooth;
                padding: 20px 0;
                box-sizing: border-box;
                margin: 0 auto;
                position: relative;
            }


        </style>
    </head>
    <body>

        <div class="container">
            <h2>Phổ biến nhất</h2>
            <button class="scroll-btn left-arrow">&#10094;</button>
            <button class="scroll-btn right-arrow">&#10095;</button>
            <div class="card-wrapper" id="cardContainer">
                <div class="card">
                    <div class="thumbnail"></div>
                    <div class="card-body">
                        <p>This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                        <div class="card-footer">
                            <button class="btn">View</button>
                            <button class="btn">Edit</button>
                            <span class="time-info">9 mins</span>
                        </div>
                    </div>
                </div>
                <div class="card">
                    <div class="thumbnail"></div>
                    <div class="card-body">
                        <p>This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                        <div class="card-footer">
                            <button class="btn">View</button>
                            <button class="btn">Edit</button>
                            <span class="time-info">8 mins</span>
                        </div>
                    </div>
                </div>
                <div class="card">
                    <div class="thumbnail"></div>
                    <div class="card-body">
                        <p>This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                        <div class="card-footer">
                            <button class="btn">View</button>
                            <button class="btn">Edit</button>
                            <span class="time-info">7 mins</span>
                        </div>
                    </div>
                </div>
                <div class="card">
                    <div class="thumbnail"></div>
                    <div class="card-body">
                        <p>This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                        <div class="card-footer">
                            <button class="btn">View</button>
                            <button class="btn">Edit</button>
                            <span class="time-info">6 mins</span>
                        </div>
                    </div>
                </div>
                <div class="card">
                    <div class="thumbnail"></div>
                    <div class="card-body">
                        <p>This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                        <div class="card-footer">
                            <button class="btn">View</button>
                            <button class="btn">Edit</button>
                            <span class="time-info">5 mins</span>
                        </div>
                    </div>
                </div>
                <div class="card">
                    <div class="thumbnail"></div>
                    <div class="card-body">
                        <p>This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                        <div class="card-footer">
                            <button class="btn">View</button>
                            <button class="btn">Edit</button>
                            <span class="time-info">4 mins</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script>
            document.addEventListener('DOMContentLoaded', function () {
                const container = document.getElementById('cardContainer');
                const cards = Array.from(container.querySelectorAll('.card'));
                const singleCardWidth = 320; 

                
                function duplicateCards() {
                    let cardsHTML = container.innerHTML;
                    container.innerHTML = cardsHTML + cardsHTML + cardsHTML; 
                }

                duplicateCards(); 

               
                container.scrollLeft = singleCardWidth * cards.length;

                function scrollHorizontal(direction) {
                    let scrollStep = singleCardWidth * direction;
                    container.scrollLeft += scrollStep;

                    
                    setTimeout(() => {
                        let maxScrollLeft = container.scrollWidth - container.clientWidth;
                        if (container.scrollLeft >= maxScrollLeft - singleCardWidth) {
                            container.scrollLeft = singleCardWidth * cards.length;
                        } else if (container.scrollLeft <= singleCardWidth * cards.length - singleCardWidth) {
                            container.scrollLeft = maxScrollLeft - (singleCardWidth * cards.length) + singleCardWidth;
                        }
                    }, 100); 
                }

                document.querySelector('.left-arrow').addEventListener('click', () => scrollHorizontal(-1));
                document.querySelector('.right-arrow').addEventListener('click', () => scrollHorizontal(1));
            });

        </script>
    </body>
</html>
