// 좋아요 버튼에 이벤트 리스너 등록
const likeButtons = document.getElementsByClassName('like-button');
Array.from(likeButtons).forEach(button => {
    button.addEventListener('click', function(event) {
        event.preventDefault(); // 폼 전송 방지

        const accoNo = this.getAttribute('data-acco-no');
        const form = this.parentElement;
        const heartIcon = this.querySelector('i');

        // AJAX 요청 보내기
        const xhr = new XMLHttpRequest();
        xhr.open('POST', form.action, true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4 && xhr.status === 200) {
                // 요청이 성공적으로 완료되면, 하트 아이콘을 채워진 하트로 변경
                heartIcon.classList.remove('far');
                heartIcon.classList.add('fas');
            }
        };
        xhr.send(`accoNo=${accoNo}`);
    });
});