<script>
    function initializePlayButtons() {
        const playButtons = document.querySelectorAll('.play-btn');

        playButtons.forEach(btn => {
            btn.addEventListener('click', function() {
                const audioId = this.getAttribute('data-audio-id');
                const audioElement = document.getElementById(audioId);

                if (audioElement.paused) {
                    audioElement.play();
                    this.innerText = 'Pause';
                } else {
                    audioElement.pause();
                    this.innerText = 'Play';
                }
            });
        });
    }

    document.addEventListener('DOMContentLoaded', initializePlayButtons);
    document.addEventListener('turbo:load', initializePlayButtons);
</script>