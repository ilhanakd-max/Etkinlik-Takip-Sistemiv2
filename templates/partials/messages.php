<?php if (isset($error) && $error): ?>
    <div class="alert alert-danger"><?php echo htmlspecialchars($error); ?></div>
<?php endif; ?>
<?php if (isset($message) && $message): ?>
    <div class="alert alert-success"><?php echo htmlspecialchars($message); ?></div>
<?php endif; ?>
<?php if (isset($login_error) && $login_error): ?>
    <div class="alert alert-danger"><?php echo htmlspecialchars($login_error); ?></div>
<?php endif; ?>
