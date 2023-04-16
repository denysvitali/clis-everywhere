<script setup lang="ts">
import { computed } from 'vue'
import { handleBackground } from '../layoutHelper'
const props = defineProps({
  image: {
    type: String,
  },
  imageWidth: {
    type: String,
    required: false,
  },
  backgroundSize: {
    type: String,
    default: "cover",
  },
  class: {
    type: String,
  },
})
const style = computed(() => {
    let s = handleBackground(props.image)
    s.backgroundSize = props.backgroundSize;
    if(props.imageWidth != ""){
      s.width = props.imageWidth
      s.marginLeft = "auto"
    }
    return s;  
  }
)
</script>

<template>
  <div class="grid grid-cols-2 w-full h-full">
    <swisscom-branding/>
    <div class="slidev-layout default" :class="props.class">
      <slot />
    </div>
    <div class="w-full" :style="style" />
  </div>
</template>