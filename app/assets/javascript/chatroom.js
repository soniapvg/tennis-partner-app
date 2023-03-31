"use strict";

{
  function setChatroomHeight() {
    const chatroom =  document.querySelector('.chatroom');
    if (chatroom != null) {
      const windowHeight = window.innerHeight;
      const headerHeight = document.getElementsByTagName('header')[0].offsetHeight;
      const footerHeight = document.getElementsByTagName('footer')[0].offsetHeight;
      const chatroomHeight = windowHeight - footerHeight - headerHeight;
      chatroom.style.height = `${chatroomHeight}px`;
    }
  }

  window.addEventListener("turbo:render", () => setChatroomHeight());
  window.addEventListener('DOMContentLoaded', () => setChatroomHeight());
  window.addEventListener('resize', () => setChatroomHeight());
  document.querySelector('.form-control').addEventListener('input', () => setChatroomHeight());
}
