# Design Pattern for Notification

實作 Notification design pattern。

## 實作說明

畫面中有一個tab controller內含四個畫面，使用者可透過首頁的 Start 來發送廣播訊息通知其餘三個畫面開始計數，這三個畫面會透過 delegate 的方式將個別頁面的計數值同步顯示於第一個畫面。若想停止計數及回覆預設後面三個畫面的值可透過 Reset 按鈕來完成。
