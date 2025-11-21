<nav class="navbar navbar-expand-lg navbar-dark mb-4">
    <div class="container">
        <a class="navbar-brand" href="?page=index">
            <i class="fas <?php echo $lang['icon']; ?> me-2"></i><?php echo htmlspecialchars($lang['title']); ?>
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link <?php echo ($page ?? 'index') === 'index' ? 'active' : ''; ?>" href="?page=index">Takvim</a></li>
                <?php if (is_admin()): ?>
                    <li class="nav-item"><a class="nav-link <?php echo ($page ?? '') === 'admin' ? 'active' : ''; ?>" href="?page=admin&tab=events">Yönetim Paneli</a></li>
                    <li class="nav-item d-flex align-items-center ms-2">
                        <span class="badge bg-light text-dark me-2"><?php echo htmlspecialchars($_SESSION['admin_user']['username']); ?></span>
                        <form method="post" class="d-inline">
                            <button name="admin_logout" class="btn btn-sm btn-outline-danger">Çıkış</button>
                        </form>
                    </li>
                <?php else: ?>
                    <li class="nav-item"><a class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#loginModal">Giriş</a></li>
                <?php endif; ?>
            </ul>
        </div>
    </div>
</nav>
