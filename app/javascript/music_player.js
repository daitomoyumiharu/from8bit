<script>
  document.addEventListener('DOMContentLoaded', function() {
    let playButtons = document.querySelectorAll('.play-btn');
    playButtons.forEach(button => {
      button.addEventListener('click', function() {
        let audioId = this.getAttribute('data-audio-id');
        let audioElement = document.getElementById(audioId);
        audioElement.play();
      });
    });
  });
</script>