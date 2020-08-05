---
to: pages/<%= parent %>/<%= name %>/index.vue
---
<script>
import { createPage } from '~/utils/contentResource';
import <%= name %> from "~/src/<%= parent %>/<%= name %>/index";

export default createPage({
  components: {
    <%= name %>
  },
  lang: `id_ID`
});
</script>
