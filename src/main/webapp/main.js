document.addEventListener('DOMContentLoaded', function() {
  // Generate random order number
  const orderNumber = 'ORD-' + Math.floor(100000 + Math.random() * 900000);
  document.getElementById('order-number').textContent = orderNumber;
  
  // Set up countdown timer (random between 30-45 minutes)
  const deliveryMinutes = 30 + Math.floor(Math.random() * 15);
  let totalSeconds = deliveryMinutes * 60;
  const minutesEl = document.getElementById('countdown-minutes');
  const secondsEl = document.getElementById('countdown-seconds');
  
  // Update countdown timer
  function updateCountdown() {
    const minutes = Math.floor(totalSeconds / 60);
    const seconds = totalSeconds % 60;
    
    minutesEl.textContent = minutes < 10 ? '0' + minutes : minutes;
    secondsEl.textContent = seconds < 10 ? '0' + seconds : seconds;
    
    if (totalSeconds > 0) {
      totalSeconds--;
      setTimeout(updateCountdown, 1000);
    } else {
      // When countdown reaches zero
      document.querySelectorAll('.status-step')[3].classList.add('active');
      createConfetti();
      minutesEl.textContent = '00';
      secondsEl.textContent = '00';
    }
  }
  
  // Start the countdown
  updateCountdown();
  
  // Create confetti effect
  createConfetti();
  
  // Simulate order progress
  setTimeout(() => {
    document.querySelectorAll('.status-step')[0].classList.add('active');
    
    setTimeout(() => {
      document.querySelectorAll('.status-step')[1].classList.add('active');
      
      setTimeout(() => {
        document.querySelectorAll('.status-step')[2].classList.add('active');
        createConfetti();
      }, 5000);
    }, 3000);
  }, 1000);
  
  // Add event listeners to buttons
  document.querySelector1('.primary-button').addEventListener('click', function() {
    alert('Tracking your food delivery...');
  });
  
  document.querySelector1('.secondary-button').addEventListener('click', function() {
    alert('Ordering again...');
  });
});

// Function to create confetti effect
function createConfetti() {
  const colors = ['#ff6b35', '#f7c59f', '#efefd0', '#004e89', '#1a659e'];
  const confettiCount = 100;
  
  for (let i = 0; i < confettiCount; i++) {
    const confetti = document.createElement('div');
    confetti.className = 'confetti';
    
    // Random position, color, size and delay
    const size = Math.random() * 10 + 5;
    const xPos = Math.random() * 100;
    const delay = Math.random() * 3;
    const color = colors[Math.floor(Math.random() * colors.length)];
    
    confetti.style.left = `${xPos}%`;
    confetti.style.width = `${size}px`;
    confetti.style.height = `${size}px`;
    confetti.style.backgroundColor = color;
    confetti.style.animationDelay = `${delay}s`;
    
    document.body.appendChild(confetti);
    
    // Remove confetti after animation completes
    setTimeout(() => {
      confetti.remove();
    }, 5000 + (delay * 1000));
  }
}