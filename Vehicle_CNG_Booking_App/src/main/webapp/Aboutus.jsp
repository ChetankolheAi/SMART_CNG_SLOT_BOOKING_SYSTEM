<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>About Us - CNG Reservation System</title>
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: "Segoe UI", Tahoma, sans-serif;
    }

    body {
      background: #000716;
      color: #e5e7eb;
      line-height: 1.6;
    }
    h2 {
  color: #ffffff; /* neon green */
  text-align: center;
  text-shadow: 0 0 5px #22c55e, 0 0 10px #22c55e, 0 0 20px #22c55e, 0 0 40px #16a34a, 0 0 80px #16a34a;
}

   
    .about-section {
      max-width: 1000px;
      margin: 80px auto;
      padding: 20px;
    }

    .about-section h2 {
      text-align: center;
      font-size: 26px;
      margin-bottom: 15px;
      color: #ffffff;
    }

    .about-section p {
      text-align: center;
      margin-bottom: 25px;
      color: #d1d5db;
    }

    .cards {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
      gap: 20px;
      margin-top: 20px;
    }

    .card {
      background: #1f2937;
      border-radius: 12px;
      padding: 20px;
      text-align: center;
      box-shadow: 0 4px 12px rgba(0,0,0,0.4);
      transition: transform 0.3s;
    }

    .card:hover {
      transform: translateY(-5px);
    }

    .card h3 {
      color: #ffffff;
      margin-bottom: 10px;
      font-size: 20px;
    }

    .card p {
      color: #9ca3af;
      font-size: 14px;
    }

    .team {
      margin-top: 50px;
    }

    .team h2 {
      text-align: center;
      font-size: 24px;
      margin-bottom: 20px;
      color: #ffffff;
    }

    .team-members {
      display: flex;
      justify-content: center;
      flex-wrap: wrap;
      gap: 25px;
    }

    .member {
      background: #111827;
      border-radius: 10px;
      padding: 20px;
      text-align: center;
      width: 220px;
      box-shadow: 0 4px 10px rgba(0,0,0,0.4);
    }

    .member img {
      width: 100px;
      height: 100px;
      border-radius: 50%;
      margin-bottom: 10px;
      border: 3px solid #10b981;
      object-fit: cover;
    }

    .member h4 {
      color: #e5e7eb;
      margin-bottom: 5px;
    }

    .member p {
      font-size: 13px;
      color: #9ca3af;
    }

   
  </style>
</head>
<body>
	  <header id="navbar"></header>


  <section class="about-section">
    <h2>Who We Are</h2>
    <p>We are a dedicated team behind the <strong>CNG Reservation System</strong>, working to simplify how people book CNG refueling slots. Our mission is to provide a smooth, time-saving, and eco-friendly experience.</p>

    <div class="cards">
      <div class="card">
        <h3>Our Mission</h3>
        <p>To make CNG reservations simple, fast, and accessible to everyone through digital innovation.</p>
      </div>
      <div class="card">
        <h3>Our Vision</h3>
        <p>To lead the transition towards smarter energy consumption and convenience in transportation services.</p>
      </div>
      <div class="card">
        <h3>Our Values</h3>
        <p>Transparency, Efficiency, Customer Care, and Commitment to Green Energy.</p>
      </div>
    </div>

    <div class="team">
      <h2>Meet Our Team</h2>
      <div class="team-members">
        <div class="member">
          <img src="data:image/png;base64,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" alt="Team Member">
          <h4>Sushant Patade</h4>
          <p>Founder & CEO</p>
        </div>
        <div class="member">
          <img src="data:image/png;base64,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" alt="Team Member">
          <h4>Kalpesh Patil</h4>
          <p>Backend Developer</p>
        </div>
        <div class="member">
          <img src="data:image/png;base64,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" alt="Team Member">
          <h4>Siddesh Patil</h4>
          <p>DataBase Manager</p>
        </div>
        <div class="member">
          <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAASsAAACoCAMAAACPKThEAAABXFBMVEUAAAAAt/0AAQAAAQUAAQYAu/8Atf4Auv8AAwwAvf8AAw4AAgkABBEAt/4ABA4ABRUABRgAACYABh0AAB0ACCYAAC4BACMAABkAACAAABUAADMABigABiIAAEwBsv8AAB4BACoAAD8Bi+UAADEBAEUAqfYBAFIArP8AADsBmeMAAEABH2kADDsBADcAAEkAAFkAAGsDGHgCOZYBTKcBVagCDWgBVbYBddMBofUBRpoDK30AHIMBedABAGMAg9gBd9YBaLgBK5IARaYBjt0CH3MCV6YCZMMBMYACS5kBZqcCPXwBfMcBN4AEJlMBWJYBYJcBGDYCPGQDh8MBda4CMFMCHFcBe8cBJWMCaLwDGUcBE18DIVsAWZwBhdIAFVIAL2ECRnoBaZoCldQDLFACUHoDHTMAeOgApOgDTYwAWNABj/wBac0BVsAAQ7EBVN8AL6IAaPcBff8CNnIBT9LNy4A+AAANYElEQVR4nO1dC3fTxhJeS6u3ZNnyI3HsGOdhEpOE3DxKDaUhNAkQSEggpRAKCaWlaXrbhgv//5y7D0mW5F0HKOB4re/kgC1LPtrvzMx+MztaA5AiRYoUKVKkSJEiRYoUKVKkSJEiRYoUKVKkSJEiRYoUKVKkGDpICfT7fi48CEUpURxEjUgmf/6r5IfDjpAJifCUBDqEP0/JwiBcUZagDDEsBPIC+nShv5Sr0PEQT4gYK2tmbdt1cznXRv+bWcu0YGhgQ+2LJIb7TFi6ads5r1asNqYaYwilUqNarOVyOVu3LOqMlKyhpItYCSEK6pbrerXGwsTVxf8sLa+srqyurq4sL30/PrHQyBdc29Stjm31+76/OuiYqUnZbq5YvTL+zfK1byfbM46hGASKVm9Pfnv9xuJEo4ac0iLuKA2pnCBEIaZq1anx765NtlVF0bSMk+lA0xRFbd+8/v3YlJezLRrsh2tS7BiVlXWL89NL1yZVZEYZNjTDqK9dX1yoerYO8WQ5VJblMwUt0y2OjX93a4bLUwBFaa0vjpWRbWEJAYbLtAASCVau1lhcXnOUc4jy6VJvbs4Wc6Yf5Pt9/18FRHoi6LaXn749+YFMYRj19cUFz8VswY42Exi+UIC6W5xduqV9OFPEtpor03mPCAjyXf0ezJcFtSoITa8x8UNTcc7nJwZN29icQjF+GOZDalVQN2tT39w0zovoTNNytibKrk7dsN/D+cKg6rM4drv90UZF4GSUtctl14Sy3O+hfEEEqgqFqursNfVTjIrCaN8oeSZR8aJaVpD/Qbc6fufTmULQ6ndR0BLZsihVlp6tXr71cdNfN1nqvXwtKzBZVFdZOUSV8QF8KPysB+PeVE2Hgk6GQV6Tq45P9qCKxHtlZsZobt9/0FIcbvzXtkoeTqYFJMsPVtD1rnKtStMUTa07muLs7D7crQJg79XrCtdd75VxwiMoV4gquzb7jDN4JdPaeNFABBX2d8klNBo9epzhXKDulHMWngtFmw3RgJAHmrXZFdbI1YzRPNjXQWe9K1iWQPjxYIZpiVp9ruxapFjax4F9flCz0r3Gcp057JMtclpssatDV+OBwWJYa00XsHIQzrKIXG8stllzm3LyBGBqAFng6iynBvV45IlrLLKUnxo5XRbPsogHjk8yh9yaDUmJwmeAHl9n2aNxf9TtumzgQZRV+RrTqtrLQSCPdX/4kyd1X7AwybhWa169ZEOhuCIiFJrFb2ZYVDUPayAcbjdXxBMBmF9lcOUo63k8F/ZxbJ8bRC7o3pU1xnymTG554XkMBPrp6XW2in9a1sWqKZOMuXxXZYy1eevZCD2JxVSHrf3VJosqZWMMhXeR5Dv2QG+WFXGUhyv7/kkhN3QlPmlZ11kOjELW/UuuOEVSHJshdBs3GFQZB2DEPynSyifFD9GDsM4yy4y2kc9lhbEr0jKU9WbXurlStgH0z+mwQiyLHo11qrXZebSyk7cFKvvhRLC82a3YtdZTXyz4rketKhh1cJCk3WCXU6FRXpbIVCgCV7TClyvd6Z4EldVDQFOUjpoKuYqFdxlYz3jlCfVpATuhMFyZxcuM7EadfkMX3KXQhKIXRvxSBmVmdkQYf1DOQTEMiwhRu3G9O7tR1oJT4lE8eZS8gy1ulbQ54enicGW5E4zkt74CLJlDFL00PIas7yW36GfcL9hCaHdSt9ILz7uVpNMaB3LIFcssIvzJ4AW38oyc0Ibwq47qi0DCXFn2KMMFMzM/d7iK6aPIRBh8IIOnXK405IQiJIV0FnSnbjK4MvaIuurMg10Xd2K7DOwmt5kt827UFGDNHnOF0ubpNmOMxm+AthcDNleJMLbHDVjKC1IfHXyucJHv0qbDSFCQXQE/OUlwJUnRyREfQecdMnMcwtXLUVcAOUoKdexwlTG2fXXFtquIUZFHJ2SuatCaCzkdDnyag0M7tPNs0d2iGQ4nXkUdkFQSNrgKy5mu6IOfEmKudG+MkTcjqCBCVnIejLggzXIAX41q90fMwZ8ICVe5K+wERcmDzsMjkWgFkrVkgN3wiF3AIl/0YiQ7+GV3siw4cpU93xvHcbsKkmbA5GqP3wZhbBdsa+C5wl6mF+aYK6gZ5RUIGrDjeY6UPIJ98Ed+24z2YNQWYe0LcTV6l1OmOwARhRWjpqv8h0474XO1kR/8dUIi27OFHY5JNBtkuVlKglwaP4IXn7liVGtN5QaeK5LhmIUdTqhRHgL5fK6Azzl4zCNLa86Slpk+j/VfgsR2LleZegOQWrkEzuMKc7rPU+5aa8EcfK6ID1bu8sKy8ZMfscKiAgd0EuBNhUi4uyJUGlA6WLjBTeVUUpeJqfeAnW6uuF6oNcfcwbcrPEhzhKMZ8ChfBlOhFCcLdHkl5qrAngu15tTgcyXRHGecL7mNVx2r6grwsXe9DKvVcAdet5PyVdZjLeIEJlE/BMESYYypKFfku4goeM3+ohbWV/0c6GeBDFE+uNCjRKC1AMOyQEyh+l8FzANOvHpdMQferojittwGq+0j9MK94NQwTgXvE5b1i8oRWNoDW4CHmShXeWa7ZwB1P+gPTXLVWaMneM37FmXbFIQraI9u9XqqxDjwS8nBGn2QE0oxq5J5wQrrf1Mf/FYZ2qtduNHzWcG6HYT3kCs/sYkvEXKiFeLqZyHq7Xj60r0rzKa8cKjH5NRovApqykGcJ38nHLtyTipEXg08V8ggrFyDXUT2YfwCInI08MGuiZGfOr+u2GK09uF15zK3I4jY1WN8XpyqeBckwa9cF3yhZwVYSwX0KQBetS+wC3xeQlxF0x1AJNhvHK4c5Z1tyXDwmSKrE1bhiJsRYq5O6IkxyZDQojKXqkymWbIHP1ph0OaPEl+5I9SLQD6HK6REeW6sICUqCFekV62y1UONag7u246E9eCfmF294RV2kAsK06uGyXLnHL5h1X9vgAgx0b6GSGjnSoZmRYTEGYOUGpBhtfh21RzFj1km5kEQj+0A5Dh2pWyL4oJ+mpM1+WmOtuGflxANMd6i8io+p6qHZB1VGK5QdOdLd+Mm7S2SIoYUvva9y9vjdTMoL01bqOcmkMSy13nR3fgDQDr/BfNg3MCKj355XedapfFOsE2LcB/k7AzPMt6BcH/HaB6IXrw5eNw6UbUeOxppLWBDOOCl9hhkYJmVe5yi5sxUlKMIVyhGGVoiOiV3t9BeWSKsdkWBl5/zG0yynNNCyE202IDfdskEVY3PhiiVFKDKlwAiq8Je+jIegXi0kQJvBCAhExxVTdiVs2vqAnQyREHFu7nOiNDqnzZIRGYuV8iq4lQpewBLdpHCla8bKmNdWaGjnS4BVms7kRFvosyoBDGulMfQFm5/Bl83VOaoC/mOhBu5/ztGPu+6gPwb6V9wnG6qtGajIgvwcEkCuIEKZTrggRKQhC1FU/9qAKY4IirLth+FW9VRqmI+6TjHFV0YGdqBRDIdyzzsdI6qqtL++xKge2czL8oBcEzI8olKRC/loSzeHIhBOxJ0azecyBztz9sQyD24wkX0YzX0v0RcNzZM2xJsDvRBuIJZ8Crjhyz19yW/oUNixWZJxkRC8Gs9sKrEFNgq2ZaAHugDbypjgt80DY965vSyTbYY5yRzEtBdSdbtsWOmA2rNUdzKJ5Ra6IB6ITTtnbaScdr/LOGnlGUacFhcSQDWbGAfnZ063VxpzV2LxHVBzQoPC8rQnfpu0mi/PZvXg93AmD5IUCwBkN+843Q5YP0QWGLtI9MFiWwFmV/58+3ZUU0PPZDDFTpcnHdNONtMhvXWoZyVB7+LqCdoP/Gr//1z9rxqw2B/MD5XEvDmiwvH8acPNWV7VIdCqoUYMCt/IKbmi27ggnwPJGd7z6/En+ZRmu8ssnAjsgP6uP/++XzJ34O9l1UBWs2qjraUuP8twKwlVimUh7tn8zUPWh2ienIlJTqJtMxDq5KFsiCbovRG9XbNpWo9GGtPrpAY3e5s9O4o6rFt6+KHKor5CqB5TXRti3cyNqtdGBZyNOdxGZiBRX6tO+4bcsWPHKT7w/ETWk7VjI1joItWBe2BXFjY+0DKDk//Kq0rDvK+l8cAWEMgFUKQ2avT4HE+Rv8+XXleN5oHvwKQHbrf84q2ZJ8PePT27dOtVyDc2fbDLhMDYXvVB5mHBBp/vz09LJDJbxh+QCiGjzWL2tH79zslEBjVl7kpQQAvbb4/2wU9c6EUPqpg82wZDFegIviE8Xpe9Wzz5y9wLxccn6SNimD+bC73uW/lwuOTuJJdcHvz8HPfinjALuva0Lv9pNrvW7nwwFx5NR0cbR71+1YuOPyZoAogmJtLDasn/N4i/FNU1c25ft/NxUbQh4U1+9FcY//cC4YYRH7in8uRLGA+37zb7/u5yAgexcH7QErZ6ki23zd0gUGbIWV/00y75vb7hi40SJUL+tsUmbV+386FBlkSo4/bILJSw+oF+kwO9COXpPf7fi42SMQKev+GZl3i00C4snwFL3hrzL8Gie7+I2ApV71BWpiDH28Ur5v9syIQ74Cu2afoCanzW45pdD8fw7MynyJFihQpUqRIkSJFihQpUgww/g9XzfcvUXmROQAAAABJRU5ErkJggg==" alt="Team Member">
          <h4>Chetan Kolhe</h4>
          <p>FrontEnd Developer</p>
        </div>
      </div>
    </div>
  </section>

  <footer id="footer"></footer>
<script>
    // Load navbar and footer dynamically
    fetch("navbar.jsp").then(res => res.text()).then(data => {
      document.getElementById("navbar").innerHTML = data;
    });
    fetch("footer.html").then(res => res.text()).then(data => {
      document.getElementById("footer").innerHTML = data;
    });

    
  </script>
  	
</body>
</html>
