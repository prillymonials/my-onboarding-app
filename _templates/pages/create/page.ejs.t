---
to: pages/<%= name %>/index.vue
---
<script>
import { createPage } from '~/utils/contentResource';
import <%= name %> from "~/src/<%= name %>/index";

export default createPage({
  components: {
    <%= name %>
  },
  lang: `id_ID`
});
</script>
