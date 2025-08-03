type options = {
  name: string,
  connect?: Dom.element => unit,
  disconnect?: Dom.element => unit,
}

let define: options => unit = %ffi(`
function(options) {
  const clazz = class extends HTMLElement {
    connectedCallback() {
      if (this.attached) {
        return;
      }

      if (options.connect) {
        options.connect(this);
      }
    }

    disconnectedCallback() {
      if (options.disconnect) {
        options.disconnect(this);
      }
    }
  }

  customElements.define(options.name, clazz)
}
`)
