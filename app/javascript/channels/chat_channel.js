import consumer from "./consumer"
import {Consumer} from "@rails/actioncable/src";

var consumers = consumer.subscriptions.create("ChatChannel", {
  connected() {},
  disconnected() {},
  received(data) {
    let chat = $('#conversations-list').find("[data-conversation-id='" + data['chat_id'] + "']");
    chat.find('.messages-list').find('ul').append(data['message']);
    let messages_list = chat.find('.messages-list');
    let height = $(".messages-list")[0].scrollHeight;
    messages_list.scrollTop(height);
  },

  speak(message) {
    return this.perform('speak',{
      message: message
    });
  }
});
$(document).on('submit', '.new_message', function(e) {
  e.preventDefault();
  let values = $(this).serializeArray();
  consumers.speak(values);
  $(this).trigger('reset');
});
