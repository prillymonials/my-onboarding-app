---
to: components/tool/ToolLoader.vue
---
<template>
  <div v-if="isLoading" class="loaderWrapper">
    <div class="indicator">
      <svg width="16px" height="12px">
        <polyline id="back" points="1 6 4 6 6 11 10 1 12 6 15 6" />
        <polyline id="front" points="1 6 4 6 6 11 10 1 12 6 15 6" />
      </svg>
    </div>
  </div>
</template>

<script>
export default {
  name: 'ToolLoader',
  props: {
    // eslint-disable-next-line vue/require-default-prop
    isLoading: {
      type: Boolean,
      deafult: false
    }
  }
};
</script>

<style lang="scss" scoped>
.loaderWrapper {
  position: fixed;
  height: 100%;
  width: 100%;
  left: 0;
  top: 0;
  z-index: 9999;
  background-color: rgba(0, 0, 0, 0.3);
  animation: fadeIn ease 0.5s;
  -webkit-animation: fadeIn ease 0.5s;
  -moz-animation: fadeIn ease 0.5s;
  -o-animation: fadeIn ease 0.5s;
  -ms-animation: fadeIn ease 0.5s;
  .indicator {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%) scale(4);
    svg polyline {
      fill: none;
      stroke-width: 2;
      stroke-linecap: round;
      stroke-linejoin: round;
      &#back {
        stroke: #f87300;
      }
      &#front {
        stroke: #4b2a86;
        stroke-dasharray: 12, 36;
        stroke-dashoffset: 48;
        animation: dash 1s linear infinite;
      }
    }
  }

  @keyframes fadeIn {
    0% {
      opacity: 0;
    }
    100% {
      opacity: 1;
    }
  }

  @-moz-keyframes fadeIn {
    0% {
      opacity: 0;
    }
    100% {
      opacity: 1;
    }
  }

  @-webkit-keyframes fadeIn {
    0% {
      opacity: 0;
    }
    100% {
      opacity: 1;
    }
  }

  @-o-keyframes fadeIn {
    0% {
      opacity: 0;
    }
    100% {
      opacity: 1;
    }
  }

  @-ms-keyframes fadeIn {
    0% {
      opacity: 0;
    }
    100% {
      opacity: 1;
    }
  }

  .cta {
    position: fixed;
    bottom: 20px;
    right: 30px;
    color: #222;
    font-weight: bold;
  }

  @-moz-keyframes dash {
    62.5% {
      opacity: 0;
    }

    to {
      stroke-dashoffset: 0;
    }
  }

  @-webkit-keyframes dash {
    62.5% {
      opacity: 0;
    }

    to {
      stroke-dashoffset: 0;
    }
  }

  @-o-keyframes dash {
    62.5% {
      opacity: 0;
    }

    to {
      stroke-dashoffset: 0;
    }
  }

  @keyframes dash {
    62.5% {
      opacity: 0;
    }

    to {
      stroke-dashoffset: 0;
    }
  }

  @keyframes spin {
    0% {
      transform: rotate(0deg);
    }

    100% {
      transform: rotate(360deg);
    }
  }
}
</style>
