type options = {
  name: string,
  connect?: unit => unit,
  disconnect?: unit => unit,
}

let define: options => unit = %ffi(`
function(options) {
  const clazz = class extends HTMLElement {
    connectedCallback() {
      if (this.attached) {
        return;
      }

      if (options.connect) {
        options.connect.call(this);
      }
    }

    disconnectedCallback() {
      if (options.disconnect) {
        options.disconnect.call(this);
      }
    }
  }

  customElements.define(options.name, clazz)
}
`)
