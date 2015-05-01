<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="container">
    <footer id="footer" class="row">
        <div class="col-md-5">
            <span>Sponsored by:</span>
            <a href="http://www.nerdErg.com" target="_nerdErg">
                <img class="logo" alt="nerdErg logo" src="<c:url value="/img/nerderg-logo.png"/>"/>
                <img class="name" alt="nerdErg - harness the power of the nerd" src="<c:url value="/img/nerderg-text.png"/>">
            </a>
        </div>

        <div class="col-md-4">
            <span>Site powered by:</span>
            <ul id="tools-list">
                <li class="jbake"><a href="http://jbake.org/" target="_blank" title="jBake website">jBake</a></li>
                <li class="asciidoctor"><a href="http://asciidoctor.org/" target="_blank" title="asciidoctor website">Asciidoctor</a>
                </li>
                <li class="webjars"><a href="http://www.webjars.org" target="_blank" title="Webjars website">Webjars
                </li>
                <li class="gradle"><a href="https://gradle.org/" target="_blank" title="Gradle website">Gradle</a></li>
            </ul>
        </div>

        <div id="social" class="col-md-3">
            <span>Copyright &copy; 2015 Angel Ruiz</span>

            <div class="social">
                <ul class="social-icons icon-circle list-unstyled list-inline icon-rotate">
                    <li><a href="https://www.linkedin.com/in/angelruiz" target="_blank" title="Angel's LinkedIn page"><i
                            class="fa fa-linkedin"></i></a></li>
                    <li><a href="https://github.com/aruizca" target="_blank" title="Angel's GitHub repository"><i
                            class="fa fa-github"></i></a></li>
                    <li><a href="https://twitter.com/aruizca" target="_blank" title="Angel's Twiiter account"><i
                            class="fa fa-twitter"></i></a></li>
                    <li><a href="http://aruizca.com" target="_blank" title="Angel's Blog"><i class="fa fa-male"></i></a>
                    </li>
                </ul>
            </div>
        </div>
    </footer>
</div>