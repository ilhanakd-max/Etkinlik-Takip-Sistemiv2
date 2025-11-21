<!-- Modals -->
<div class="modal fade" id="sectorModal" tabindex="-1">
    <div class="modal-dialog modal-lg">
        <form method="post" class="modal-content">
            <input type="hidden" name="csrf_token" value="<?php echo generateCSRFToken(); ?>">
            <input type="hidden" name="sector_key" id="sector_key">
            <div class="modal-header"><h5 class="modal-title" id="sectorModalLabel">Sektör Ekle/Düzenle</h5><button type="button" class="btn-close" data-bs-dismiss="modal"></button></div>
             <div class="modal-body">
                <div class="alert alert-info" id="sectorAlert">Sektör anahtarı (Key), küçük harf ve alt çizgi içermelidir ve kaydedildikten sonra değiştirilemez.</div>
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label class="form-label">Sektör Anahtarı (Key)</label>
                        <input type="text" name="new_sector_key" id="new_sector_key" class="form-control" placeholder="orn_sektor_adi" required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label class="form-label">Sektör Adı</label>
                        <input type="text" name="sector_name" id="sector_name" class="form-control" required>
                    </div>
                </div>
                <h6>Etiket Tanımları</h6>
                <div class="row">
                    <div class="col-md-4 mb-3">
                        <label class="form-label">Kaynak/Birim Etiketi</label>
                        <input type="text" name="unit_label" id="unit_label" class="form-control" placeholder="Örn: Araç / Avukat" required>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label class="form-label">Etkinlik Etiketi</label>
                        <input type="text" name="event_label" id="event_label" class="form-control" placeholder="Örn: Kiralama / Seans" required>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label class="form-label">İletişim Etiketi</label>
                        <input type="text" name="contact_label" id="contact_label" class="form-control" placeholder="Örn: Müşteri / Danışan" required>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label class="form-label">Zaman Etiketi</label>
                        <input type="text" name="time_label" id="time_label" class="form-control" placeholder="Örn: Saat / Dönüş Saati" required>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label class="form-label">İkon Sınıfı (Font Awesome)</label>
                        <input type="text" name="icon" id="icon" class="form-control" placeholder="Örn: fa-car, fa-gavel" required>
                    </div>
                    <div class="col-md-4 mb-3 d-flex align-items-end">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" name="is_active" id="sector_is_active" value="1" checked>
                            <label class="form-check-label">Aktif (Görünsün)</label>
                        </div>
                    </div>
                </div>
            </div>
             <div class="modal-footer"><button type="submit" name="save_sector" class="btn btn-primary">Kaydet</button></div>
        </form>
    </div>
</div>


<div class="modal fade" id="adminUserModal" tabindex="-1">
    <div class="modal-dialog">
        <form method="post" class="modal-content">
            <input type="hidden" name="csrf_token" value="<?php echo generateCSRFToken(); ?>">
            <input type="hidden" name="user_id" id="user_id">
            <div class="modal-header"><h5 class="modal-title" id="adminUserModalLabel">Yönetici Ekle/Düzenle</h5><button type="button" class="btn-close" data-bs-dismiss="modal"></button></div>
            <div class="modal-body">
                <div class="mb-3">
                    <label class="form-label">Kullanıcı Adı</label>
                    <input type="text" name="username" id="username" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Şifre (Değiştirmek istemiyorsanız boş bırakın)</label>
                    <input type="password" name="password" id="password" class="form-control">
                </div>
                <div class="mb-3">
                    <label class="form-label">Tam Ad</label>
                    <input type="text" name="full_name" id="full_name" class="form-control">
                </div>
                <div class="mb-3">
                    <label class="form-label">E-posta</label>
                    <input type="email" name="email" id="email" class="form-control">
                </div>
                <div class="mb-3 form-check">
                    <input class="form-check-input" type="checkbox" name="is_active" id="user_is_active" value="1" checked>
                    <label class="form-check-label">Aktif Hesap</label>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">İptal</button>
                <button type="submit" name="save_admin_user" class="btn btn-primary">Kaydet</button>
            </div>
        </form>
    </div>
</div>


<div class="modal fade" id="loginModal" tabindex="-1">
    <div class="modal-dialog">
        <form method="post" class="modal-content">
            <div class="modal-header"><h5 class="modal-title">Admin Girişi</h5><button type="button" class="btn-close" data-bs-dismiss="modal"></button></div>
            <div class="modal-body">
                <input type="hidden" name="csrf_token" value="<?php echo generateCSRFToken(); ?>">
                <div class="mb-3"><label>Kullanıcı Adı</label><input type="text" name="username" class="form-control" required></div>
                <div class="mb-3"><label>Şifre</label><input type="password" name="password" class="form-control" required></div>
            </div>
            <div class="modal-footer"><button type="button" class="btn btn-secondary" data-bs-dismiss="modal">İptal</button><button type="submit" name="admin_login" class="btn btn-primary">Giriş Yap</button></div>
        </form>
    </div>
</div>

<div class="modal fade" id="eventModal" tabindex="-1">
    <div class="modal-dialog">
        <form method="post" class="modal-content" id="eventForm">
            <input type="hidden" name="csrf_token" value="<?php echo generateCSRFToken(); ?>">
            <input type="hidden" name="event_id" id="event_id">
            <input type="hidden" name="source_page" value="<?php echo $page; ?>">
            <div class="modal-header">
                <h5 class="modal-title">Kayıt Ekle/Düzenle</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <div class="mb-3">
                    <label class="form-label"><?php echo $lang['unit_label']; ?></label>
                    <select name="unit_id" id="modal_unit_id" class="form-select" required>
                        <?php foreach($units as $u): ?>
                            <option value="<?php echo $u['id']; ?>"><?php echo htmlspecialchars($u['unit_name']); ?></option>
                        <?php endforeach; ?>
                    </select>
                </div>
                <div class="row">
                    <div class="col-6 mb-3">
                        <label class="form-label">Tarih</label>
                        <input type="date" name="event_date" id="event_date" class="form-control" required>
                    </div>
                    <div class="col-6 mb-3">
                        <label class="form-label"><?php echo $lang['time_label']; ?></label>
                        <input type="text" name="event_time" id="event_time" class="form-control" placeholder="Örn: 14:00-15:00" required>
                    </div>
                </div>
                <div class="mb-3">
                    <label class="form-label"><?php echo $lang['event_label']; ?></label>
                    <input type="text" name="event_name" id="event_name" class="form-control" placeholder="<?php echo $lang['event_placeholder']; ?>" required>
                </div>
                <div class="mb-3">
                    <label class="form-label"><?php echo $lang['contact_label']; ?></label>
                    <input type="text" name="event_contact" id="event_contact" class="form-control">
                </div>
                <div class="row">
                    <div class="col-6 mb-3">
                        <label class="form-label">Durum</label>
                        <select name="event_status" id="event_status" class="form-select">
                            <?php foreach($all_event_statuses as $key=>$st): ?>
                                <option value="<?php echo $key; ?>"><?php echo $st['display_name']; ?></option>
                            <?php endforeach; ?>
                        </select>
                    </div>
                    <div class="col-6 mb-3">
                        <label class="form-label">Ödeme</label>
                        <select name="payment_status" id="payment_status" class="form-select">
                            <option value="">Seçiniz</option>
                            <?php foreach($all_payment_statuses as $key=>$st): ?>
                                <option value="<?php echo $key; ?>"><?php echo $st['display_name']; ?></option>
                            <?php endforeach; ?>
                        </select>
                    </div>
                </div>
                <div class="mb-3">
                    <label class="form-label">Notlar</label>
                    <textarea name="event_notes" id="event_notes" class="form-control"></textarea>
                </div>
            </div>
            <div class="modal-footer d-flex justify-content-between">
                <button type="button" class="btn btn-danger" id="btnDeleteEvent" style="display:none;" onclick="deleteEvent()">Sil</button>
                <div>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">İptal</button>
                    <button type="submit" name="save_event" class="btn btn-primary">Kaydet</button>
                </div>
            </div>
        </form>
    </div>
</div>

<div class="modal fade" id="unitModal" tabindex="-1">
    <div class="modal-dialog">
        <form method="post" class="modal-content">
            <input type="hidden" name="csrf_token" value="<?php echo generateCSRFToken(); ?>">
            <input type="hidden" name="unit_id" id="form_unit_id">
             <div class="modal-header"><h5 class="modal-title"><?php echo $lang['unit_label']; ?> Düzenle</h5><button type="button" class="btn-close" data-bs-dismiss="modal"></button></div>
             <div class="modal-body">
                 <div class="mb-3"><label>Ad</label><input type="text" name="unit_name" id="form_unit_name" class="form-control" placeholder="<?php echo $lang['unit_placeholder']; ?>" required></div>
                 <div class="mb-3"><label>Renk</label><input type="color" name="unit_color" id="form_unit_color" class="form-control form-control-color"></div>
                 <div class="mb-3 form-check"><input type="checkbox" name="unit_active" id="form_unit_active" class="form-check-input" checked><label class="form-check-label">Aktif (Takvimde Görünsün)</label></div>
             </div>
             <div class="modal-footer"><button type="submit" name="save_unit" class="btn btn-primary">Kaydet</button></div>
        </form>
    </div>
</div>
