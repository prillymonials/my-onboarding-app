---
to: assets/main.scss
---
@font-face {
    font-family: "lato";
    src: url("/fonts/lato/Lato-Regular.ttf") format("truetype");
    font-weight: normal;
}

@font-face {
    font-family: 'lato';
    src: url('/fonts/lato/Lato-Bold.ttf') format('truetype');
    font-weight: 700;
}

@font-face {
    font-family: 'lato';
    src: url('/fonts/lato/Lato-Bold.ttf') format('truetype');
    font-weight: bold;
}

body {
    font-family: 'lato' !important;
}

@keyframes flickerAnimation {
    0% {
        opacity: 1;
    }

    50% {
        opacity: 0;
    }

    100% {
        opacity: 1;
    }
}

@-o-keyframes flickerAnimation {
    0% {
        opacity: 1;
    }

    50% {
        opacity: 0;
    }

    100% {
        opacity: 1;
    }
}

@-moz-keyframes flickerAnimation {
    0% {
        opacity: 1;
    }

    50% {
        opacity: 0;
    }

    100% {
        opacity: 1;
    }
}

@-webkit-keyframes flickerAnimation {
    0% {
        opacity: 1;
    }

    50% {
        opacity: 0;
    }

    100% {
        opacity: 1;
    }
}

.content-container {
    overflow-x: hidden;
    overflow-y: auto;
    margin: 0 auto;
    max-width: 480px;
}

.content-container {
    -webkit-overflow-scrolling: touch;
}

//loading
.spinner {
    position: absolute;
    left: 25%;
    top: 0px;
    height: 60px;
    width: 60px;
    margin: 0px auto;
    -webkit-animation: rotation 0.6s infinite linear;
    -moz-animation: rotation 0.6s infinite linear;
    -o-animation: rotation 0.6s infinite linear;
    animation: rotation 0.6s infinite linear;
    border-left: 6px solid rgba(245, 126, 32, 0.15);
    border-right: 6px solid rgba(245, 126, 32, 0.15);
    border-bottom: 6px solid rgba(245, 126, 32, 0.15);
    border-top: 6px solid rgba(245, 126, 32, 1);
    border-radius: 100%;
}

/* Enter and leave animations can use different */
/* durations and timing functions.              */
.slide-fade-enter-active {
    transition: all .5s ease;
}

.slide-fade-leave-active {
    transition: all .5s ease;
}

.slide-fade-enter,
.slide-fade-leave-to

/* .slide-fade-leave-active below version 2.1.8 */
    {
    transform: translateY(100%);
    opacity: 0;
}