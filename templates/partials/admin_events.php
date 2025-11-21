<h4>Raporlama ve Etkinlik Yönetimi</h4>
<p>Belirlenen tarihler arasındaki rezervasyonları filtreleyin ve raporları indirin veya sayfada görüntüleyin.</p>

<div class="card p-3 mb-4 bg-light">
    <form method="post" onsubmit="return validateReportDates(this)" id="reportForm">
        <input type="hidden" name="csrf_token" value="<?php echo generateCSRFToken(); ?>">
        <div class="row g-3">
            <div class="col-md-3">
                <label for="start_date" class="form-label">Başlangıç Tarihi</label>
                <input type="date" class="form-control" id="start_date_report" name="start_date" required value="<?php echo date('Y-m-01'); ?>">
            </div>
            <div class="col-md-3">
                <label for="end_date" class="form-label">Bitiş Tarihi</label>
                <input type="date" class="form-control" id="end_date_report" name="end_date" required value="<?php echo date('Y-m-t'); ?>">
            </div>
            <div class="col-md-3">
                <label for="unit_id_filter" class="form-label"><?php echo $lang['unit_label']; ?></label>
                <select class="form-select" id="unit_id_filter" name="unit_id_filter">
                    <option value="">Tümü</option>
                    <?php foreach($units as $u): ?>
                        <option value="<?php echo $u['id']; ?>"><?php echo htmlspecialchars($u['unit_name']); ?></option>
                    <?php endforeach; ?>
                </select>
            </div>
            <div class="col-md-3">
                <label for="status_filter" class="form-label">Durum</label>
                <select class="form-select" id="status_filter" name="status_filter">
                    <option value="">Tümü</option>
                    <?php foreach($all_event_statuses as $key => $st): ?>
                        <option value="<?php echo $key; ?>"><?php echo $st['display_name']; ?></option>
                    <?php endforeach; ?>
                </select>
            </div>
            <div class="col-md-3">
                <label for="payment_filter" class="form-label">Ödeme</label>
                <select class="form-select" id="payment_filter" name="payment_filter">
                    <option value="">Tümü</option>
                    <?php foreach($all_payment_statuses as $key => $st): ?>
                        <option value="<?php echo $key; ?>"><?php echo $st['display_name']; ?></option>
                    <?php endforeach; ?>
                </select>
            </div>
            <div class="col-md-9 d-flex align-items-end gap-2">
                <button type="submit" name="generate_report" value="view" class="btn btn-primary flex-fill">
                    <i class="fas fa-eye me-1"></i> Sayfada Görüntüle
                </button>
                <button type="submit" name="generate_report" value="xls" class="btn btn-success">
                    <i class="fas fa-file-excel me-1"></i> XLS İndir
                </button>
                <button type="submit" name="generate_report" value="doc" class="btn btn-info">
                    <i class="fas fa-file-word me-1"></i> DOC İndir
                </button>
            </div>
        </div>
    </form>
</div>

<?php if (isset($_SESSION['report_data'])):
    $report_data = $_SESSION['report_data'];
    $report_params = $_SESSION['report_params'];
    unset($_SESSION['report_data']);
    unset($_SESSION['report_params']);
?>
    <div class="report-view mt-4">
        <h5><?php echo htmlspecialchars($report_params['title']); ?></h5>
        <div class="report-summary">
            <p><strong>Tarih Aralığı:</strong> <?php echo htmlspecialchars($report_params['date_range']); ?></p>
            <p><strong>Filtreler:</strong> <?php echo htmlspecialchars($report_params['filters']); ?></p>
            <p><strong>Toplam Kayıt:</strong> <?php echo count($report_data); ?></p>
        </div>

        <?php if (empty($report_data)): ?>
            <div class="alert alert-info">Belirtilen kriterlere uygun kayıt bulunamadı.</div>
        <?php else: ?>
            <div class="table-responsive">
                <table class="table table-bordered table-striped report-table">
                    <thead>
                        <tr>
                            <th>Tarih</th>
                            <th>Gün</th>
                            <th><?php echo $lang['unit_label']; ?></th>
                            <th><?php echo $lang['event_label']; ?></th>
                            <th>Saat</th>
                            <th>İletişim</th>
                            <th>Durum</th>
                            <th>Ödeme</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($report_data as $event):
                            $is_weekend = date('N', strtotime($event['event_date'])) >= 6;
                            $is_holiday_data = is_holiday($event['event_date'], $pdo);
                            $row_class = '';
                            if ($is_holiday_data) $row_class = 'bg-warning-subtle'; // Tatilse hafif sarı
                            elseif ($is_weekend) $row_class = 'bg-secondary-subtle'; // Hafta sonu ise hafif gri
                        ?>
                            <tr class="<?php echo $row_class; ?>">
                                <td><?php echo turkish_date('d M Y', strtotime($event['event_date'])); ?></td>
                                <td><?php echo turkish_date('l', strtotime($event['event_date'])); ?></td>
                                <td><?php echo htmlspecialchars($event['unit_name']); ?></td>
                                <td><?php echo htmlspecialchars($event['event_name']); ?></td>
                                <td><?php echo htmlspecialchars($event['event_time']); ?></td>
                                <td><?php echo htmlspecialchars($event['contact_info']); ?></td>
                                <td><span class="badge badge-status-<?php echo $event['status']; ?>"><?php echo $all_event_statuses[$event['status']]['display_name']; ?></span></td>
                                <td>
                                    <?php
                                        $p_status = $event['payment_status'];
                                        if ($p_status) {
                                            echo '<span class="badge badge-payment-' . $p_status . '">' . $all_payment_statuses[$p_status]['display_name'] . '</span>';
                                        } else {
                                            echo '-';
                                        }
                                    ?>
                                </td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        <?php endif; ?>
    </div>
<?php endif; ?>
