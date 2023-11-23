window.initMap = function () {
    const map = new google.maps.Map(document.getElementById("map"), {
        center: { lat: 37.5400456, lng: 126.9921017 },
        zoom: 10
    });

    const malls = [
        { label: "C", name: "허영올레 걷기축제 & 걷기주간", lat: 33.2540922, lng: 126.5601945 },
        { label: "G", name: "제로포인트트레일 더블 챌린지", lat: 33.516595, lng: 126.5305315 },
        { label: "D", name: "한림공원 왕벚꽃축제", lat: 33.3883099, lng: 126.2394248 },
        { label: "I", name: "JEMI 페스타", lat: 33.5054697, lng: 126.5345108 },
        { label: "L", name: "제주아트디자인페스타2021", lat: 33.4516537, lng: 126.4483934 },
        { label: "M", name: "2022 제13회 제주프랑스영화축제", lat: 33.5000748, lng: 126.5272959 },
        { label: "T", name: "2022 서귀포 봄맞이축제", lat: 33.2455319, lng: 126.564526 }
    ];

    const bounds = new google.maps.LatLngBounds();
    const infoWindow = new google.maps.InfoWindow();

    malls.forEach(({ label, name, lat, lng }) => {
        const marker = new google.maps.Marker({
            position: { lat, lng },
            label,
            map
        });
        bounds.extend(marker.position);

        marker.addListener("click", () => {
            map.panTo(marker.position);
            infoWindow.setContent(name);
            infoWindow.open({
                anchor: marker,
                map
            });
        });
    });

    map.fitBounds(bounds);
};
