import { Socket } from "phoenix"
import LiveSocket from "phoenix_live_view"
import { Socket } from "phoenix"

export const adminSocket = new Socket("/admin_socket", {
    params: { token: window.adminToken }
})

export const productSocket = new Socket("/product_socket")

export function connectToLiveView() {
    const liveSocket = new LiveSocket("/live", Socket)
    liveSocket.connectToLiveView()
}