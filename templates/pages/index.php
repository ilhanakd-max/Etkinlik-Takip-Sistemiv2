<div class="card p-3">
    <form method="get" class="row g-3 align-items-center">
        <div class="col-md-4">
            <label class="form-label fw-bold"><?php echo $lang['unit_label']; ?></label>
            <select name="unit_id" class="form-select" onchange="this.form.submit()">
                <?php if (empty($units)): ?>
                    <option value="">Lütfen yönetici panelinden birim/kaynak ekleyin.</option>
                <?php endif; ?>
                <?php foreach($units as $u): ?>
                    <option value="<?php echo $u['id']; ?>" <?php echo $selected_unit==$u['id']?'selected':''; ?>><?php echo htmlspecialchars($u['unit_name']); ?></option>
                <?php endforeach; ?>
            </select>
        </div>
        <div class="col-md-3">
            <label class="form-label fw-bold">Ay</label>
            <select name="month" class="form-select" onchange="this.form.submit()">
                <?php for($k=1; $k<=12; $k++): ?>
                    <option value="<?php echo $k; ?>" <?php echo $selected_month==$k?'selected':''; ?>><?php echo $turkish_months[$k]; ?></option>
                <?php endfor; ?>
            </select>
        </div>
        <div class="col-md-3">
            <label class="form-label fw-bold">Yıl</label>
            <input type="number" name="year" class="form-control" value="<?php echo $selected_year; ?>" onchange="this.form.submit()">
        </div>
        <div class="col-md-2 text-end">
            <?php if(is_admin()): ?>
                <label class="form-label d-block">&nbsp;</label>
                <button type="button" class="btn btn-success w-100" onclick="newEvent()">
                    <i class="fas fa-plus"></i> Yeni Ekle
                </button>
            <?php endif; ?>
        </div>
    </form>
</div>

<div class="card p-2 mb-4">
    <div class="d-flex gap-3 flex-wrap justify-content-center">
        <h6>Durumlar:</h6>
        <?php foreach($all_event_statuses as $key=>$st): ?>
            <span class="badge badge-status-<?php echo $key; ?>"><?php echo $st['display_name']; ?></span>
        <?php endforeach; ?>
        <h6>Ödeme:</h6>
        <?php foreach($all_payment_statuses as $key=>$st): ?>
            <span class="badge badge-payment-<?php echo $key; ?>"><?php echo $st['display_name']; ?></span>
        <?php endforeach; ?>
    </div>
</div>

<?php if ($selected_unit): ?>
<div class="calendar-grid mb-5">
    <?php
    $days_in_month = cal_days_in_month(CAL_GREGORIAN, $selected_month, $selected_year);
    $first_day_w = date('N', strtotime("$selected_year-$selected_month-01"));

    // Boş kutular (Pazartesi başlangıç)
    for($i=1; $i<$first_day_w; $i++) echo '<div class="d-none d-lg-block"></div>';

    // Etkinlikleri Çek
    $events_by_date = [];
    try {
        $raw_events = $pdo->prepare("SELECT * FROM events WHERE unit_id = ? AND event_date BETWEEN ? AND ? ORDER BY event_time");
        $raw_events->execute([$selected_unit, "$selected_year-$selected_month-01", "$selected_year-$selected_month-$days_in_month"]);
        foreach($raw_events->fetchAll() as $row) {
            $events_by_date[$row['event_date']][] = $row;
        }
    } catch (PDOException $e) {
        echo '<div class="alert alert-danger w-100">Etkinlikler yüklenemedi. Veritabanı yapısını kontrol edin.</div>';
    }


    for($day=1; $day<=$days_in_month; $day++):
        $date = sprintf("%04d-%02d-%02d", $selected_year, $selected_month, $day);
        $is_weekend = (date('N', strtotime($date)) >= 6);
        $is_holiday_data = is_holiday($date, $pdo);
        $is_holiday_flag = $is_holiday_data !== false;

        $card_class = '';
        if ($is_holiday_flag) {
            $card_class = 'holiday';
        } elseif ($is_weekend) {
            $card_class = 'weekend';
        }
    ?>
        <div class="day-card <?php echo $card_class; ?>">
            <div class="day-header">
                <span><?php echo $day; ?> <small class="fw-normal"><?php echo mb_substr($turkish_months[$selected_month],0,3); ?></small></span>
                <small class="text-muted"><?php echo turkish_date('l', strtotime($date)); ?></small>
                <?php if($is_holiday_flag): ?>
                    <span class="badge bg-danger"><?php echo htmlspecialchars($is_holiday_data['holiday_name']); ?></span>
                <?php endif; ?>
                <?php if(is_admin()): ?>
                    <a href="#" class="text-success" onclick="newEventForDay('<?php echo $date; ?>')" title="Yeni <?php echo $lang['event_label']; ?> Ekle"><i class="fas fa-plus-circle"></i></a>
                <?php endif; ?>
            </div>
            <div class="p-2">
                <?php $day_events = $events_by_date[$date] ?? []; ?>
                <?php if (empty($day_events)): ?>
                    <p class="text-muted text-center" style="font-size: 0.8rem;">Kayıt yok.</p>
                <?php endif; ?>
                <?php foreach($day_events as $evt):
                    $status_color = $all_event_statuses[$evt['status']]['color'] ?? '#ccc';
                    $payment_text = '';
                    if (!empty($evt['payment_status'])) {
                        $payment_data = $all_payment_statuses[$evt['payment_status']] ?? null;
                        if ($payment_data) {
                            $payment_text = ' <span class="badge badge-payment-' . $evt['payment_status'] . ' ms-1">' . $payment_data['display_name'] . '</span>';
                        }
                    }
                ?>
                    <div class="event-item" style="border-left-color: <?php echo $status_color; ?>"
                         onclick='editEvent(<?php echo json_encode($evt); ?>)'>
                        <strong><?php echo htmlspecialchars($evt['event_time']); ?></strong>
                        <?php echo $payment_text; ?><br>
                        <?php echo htmlspecialchars($evt['event_name']); ?>
                    </div>
                <?php endforeach; ?>
            </div>
        </div>
    <?php endfor; ?>
</div>
<?php else: ?>
     <div class="alert alert-warning">Yönetilecek birim veya kaynak bulunamadı. Lütfen Admin Panelinden (Yönetim Paneli) birim/kaynak ekleyin.</div>
<?php endif; ?>
