<h4>Aktif Sektör Seçimi</h4>
<p>İşletme tipinize göre arayüzü özelleştirin. Seçiminiz, takvimdeki **Birim/Oda** ve **Etkinlik** gibi tüm terimleri değiştirecektir.</p>
<form method="post">
    <input type="hidden" name="csrf_token" value="<?php echo generateCSRFToken(); ?>">
    <div class="mb-3">
        <label class="form-label">Aktif Sektör Modu</label>
        <select name="active_sector" class="form-select form-select-lg">
            <?php foreach($sector_configs as $key => $conf): ?>
                <option value="<?php echo $key; ?>" <?php echo $active_sector==$key?'selected':''; ?>>
                    <?php echo $conf['title']; ?> (<?php echo $conf['unit_label']; ?> / <?php echo $conf['event_label']; ?>)
                </option>
            <?php endforeach; ?>
        </select>
    </div>
    <button type="submit" name="save_settings" class="btn btn-primary">Ayarları Kaydet</button>
</form>
