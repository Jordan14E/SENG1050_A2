<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html"/>
    <!--Name: xslPage.xsl
	Author: Jordan Eade
	Student Number: c3350651
	Date file created: 20/10/21
-->

    <xsl:template match="carsForSale">      <!--Start of template for overall xml document-->
        <!--using HTML inside template document-->
        <html lang="en">
            <head>
                <meta charset="UTF-8"/>
                <link  rel="stylesheet" type ="text/css" href="../style.css"/>		<!--Link to css document for styling-->
                <style>     <!--Document level styling-->
                    #desDiv{font-size: larger;}
                </style>
                <title><xsl:text>Jim's cars- </xsl:text><xsl:value-of select="car/@vehicleType"/></title>		<!--Document title-->
            </head>
            <body>
                <div id="head">			<!--Holds page heading, logo and navigation bar-->
                    <img src="../Images/logo.png" alt ="logo" id="logo"/>		<!--"Jim's group logo image-->
                    <xsl:if test="car/@vehicleType = 'fourWheelDrive'">         <!--If the type of vehicle is a four
                                                                                wheel drive the heading will be he following.
                                                                                if it was just using value of function there
                                                                                would be no spaces-->
                        <h1 style= "text-align: center">Four Wheel Drives</h1>
                    </xsl:if>
                    <xsl:if test="car/@vehicleType = 'sportCar'">               <!--If the type of vehicle is a sports car
                                                                                the heading will be he following.
                                                                                if it was just using value of function there
                                                                                would be no spaces-->
                        <h1 style= "text-align: center">Sports Cars</h1>
                    </xsl:if>
                    <hr/>

                    <a class="link" href="../index.html">Home</a>       <!--Link to the home page-->
                    -
                    <!--If statements used to determine which xml document is being read and print the correct link
                    This prevents the four wheel drive link turning up on its own page and vice versa-->
                    <xsl:if test="car/@vehicleType = 'fourWheelDrive'">
                        <a class="link" href="sportsCar.xml">Sports Cars</a>
                    </xsl:if>
                    <xsl:if test="car/@vehicleType = 'sportCar'">
                        <a class="link" href="fourWheelDrive.xml">Four Wheel Drives</a>
                    </xsl:if>
                    -
                    <a class="link" href="../data.html">Create Listing</a>      <!--Link to data collection page-->
                    -
                    <a class="link" href="../privacy.html">Privacy policy</a>       <!--Link to privacy policy page-->
                    -
                    <a class="link" href="../terms.html"><![CDATA[Terms & Conditions]]></a>     <!--Link to terms and conditions page-->
                    -
                    <a class="link" href="../contact.html">Contact Us</a>       <!--Link to contact page-->
                    -
                    <a class="link" href="../aboutUs.html">About Us</a>     <!--Link to about page-->

                    <hr/>
                    <br/>
                </div>
                    <br/>

                <div id="list" style="float:left;">     <!--List division to format the list specially-->
                <xsl:apply-templates select="car">      <!--Applying the car template to print each car-->
                        <xsl:sort select="carModel"/>   <!--Sorting matches for the car template to have them in an order-->
                </xsl:apply-templates>
                </div>
                <!--Formatting the address section-->
                <address id="copyright">Copyright - Jordan Eade<br/>University of Newcastle<br/>c3350651@uon.edu.au<br/>		<!--copyright statement-->
                    <!--External website, goes to Assessment 1 brief for SENG1050-->
                    <a href="https://uonline.newcastle.edu.au/bbcswebdav/pid-5239564-dt-content-rid-30198625_1/courses/CRS.134585.2021.S2/SENG1050%20-%20Assignment%202.html#peb">Assessment Brief</a>
                </address>
            </body>
        </html>

    </xsl:template>     <!--Closing for overall xml file template-->

    <xsl:template match="car">      <!--Template to display cars and information-->
        <!--Using combination of value of and xsl:text to give correct punctuation and spacing for heading-->
        <h2><xsl:value-of select="make"/><xsl:text> </xsl:text><xsl:value-of select="carModel"/><xsl:text>, </xsl:text><xsl:value-of select="year"/></h2>
        <br/>


        <img alt="Picture not found" class="carPic">    <!--adding picture from xml-->
            <xsl:attribute name="src">              <!--Use xsl:attribute to insert a value from the xml document in an attribute-->
                    <xsl:value-of select="picture"/>
            </xsl:attribute>
        </img>
        <br/>

        <ul>
            <li>
            <xsl:text>Price: </xsl:text><xsl:value-of select="cost"/><!--Cost of the vehicle, taken from the XML cost element-->
            </li>
            <li>
            <xsl:text>Safety rating: </xsl:text>                <!--Safety Rating, uses the choose and when functions to determine which star rating
                                                                    to display based on the child on safetyRating in the XML document -->
                <!--See README.txt I included reference to show I researched it-->
                <!--Tests which is a child of safety rating for this car and determines what to print-->
            <xsl:choose>
                <xsl:when test="safetyRating/star1">1 star</xsl:when>
                <xsl:when test="safetyRating/star2">2 star</xsl:when>
                <xsl:when test="safetyRating/star3">3 star</xsl:when>
                <xsl:when test="safetyRating/star4">4 star</xsl:when>
                <xsl:when test="safetyRating/star5">5 star</xsl:when>
            </xsl:choose>
            </li>

            <!--odometerReading-->
            <li>
                <xsl:text>Odometer reading: </xsl:text><xsl:value-of select="odometerReading"/> <!--Taking odometer value from xml-->
            </li>
            <!--year-->
            <li>
                <xsl:text>Year of Production: </xsl:text><xsl:value-of select="year"/>  <!--Taking year value from xml-->
            </li>

            <!--fuelType-->

            <li>
                <xsl:text>Fuel type: </xsl:text><xsl:value-of select="fuelType"/>   <!--Taking fuelType value from xml-->
            </li>

            <!--transmission-->

            <li>
                <xsl:text>Transmission: </xsl:text><xsl:value-of select="transmission"/>    <!--Taking transmission value from xml-->
            </li>

            <!--driveType-->

            <li>
                <xsl:text>Drive type: </xsl:text><xsl:value-of select="driveType"/>     <!--Taking driveType value from xml-->
            </li>


            <xsl:for-each select="extras">      <!--For each match with extras in the xml the following happens-->
                <li>
                    <xsl:text>Extra option: </xsl:text><xsl:value-of select="options"/><br/>    <!--Taking options value from xml-->
                    <xsl:text>Extra price: </xsl:text><xsl:value-of select="additionalCost"/>   <!--Taking additionalCost value from xml-->
                </li>
            </xsl:for-each>

            <!--NUmber of seats-->
            <li>
                <xsl:text>Number of seats: </xsl:text><xsl:value-of select="@noSeats"/> <!--Taking noSeats vale from xml-->
            </li>
            <!--state-->

            <li>
                <xsl:text>State listed: </xsl:text><xsl:value-of select="state"/>   <!--Taking state value from xml-->
            </li>

            <!--couponCode-->

            <!--If there is a value in couponCode the following will happen-->
            <xsl:if test="couponCode != ''">
                <li>
                <xsl:text>Jim's Cars coupon Code: </xsl:text><xsl:value-of select="couponCode"/>    <!--Take value from couponCode in xml-->
                </li>
            </xsl:if>

            <!--reviews-->
            <!--For each match with reviews in xml-->
            <xsl:for-each select="reviews">
                <li>
                <xsl:text>Review: </xsl:text><xsl:value-of select="reviews"/>   <!--Take reviews value from xml-->
                </li>
            </xsl:for-each>

            <br/>

            <!--description-->

            <div id="desDiv">
                <xsl:value-of select="description"/>        <!--Take description value from xml-->
                <br id="doubleBR"/>

                <!--link to manufacturer website-->

                <xsl:text>Detailed information on this car can be found on the manufacturer's website:
                </xsl:text>
                <!--Inserting link-->
                <a class="link">
                <!--Using xsl:attribute to enter value from xml into the href attribute-->
                <xsl:attribute name="href">
                    <xsl:value-of select="URL"/>    <!--Take URL value from xml-->
                </xsl:attribute>
                <xsl:value-of select="URL"/>
                </a>
            </div>
        </ul>
        <br style="line-height:2cm"/>   <!--Use in-line style to extend spacing-->

    </xsl:template>

</xsl:stylesheet>