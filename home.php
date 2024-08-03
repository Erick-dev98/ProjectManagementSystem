<?php
// Start the session if not already started
if (session_status() === PHP_SESSION_NONE) {
  session_start();
}

// Include your database connection file
include('db_connect.php');

// Your existing code follows...
$twhere = "";
if ($_SESSION['login_type'] != 1)
  $twhere = "  ";
?>
<!-- Info boxes -->
<div class="col-12">
  <div class="card">
    <div class="card-body">
      Welcome <?php echo $_SESSION['login_name'] ?>!
    </div>
  </div>
</div>
<hr>
<?php

$where = "";
if ($_SESSION['login_type'] == 2) {
  $where = " where manager_id = '{$_SESSION['login_id']}' ";
} elseif ($_SESSION['login_type'] == 3) {
  $where = " where concat('[',REPLACE(user_ids,',','],['),']') LIKE '%[{$_SESSION['login_id']}]%' ";
}
$where2 = "";
if ($_SESSION['login_type'] == 2) {
  $where2 = " where p.manager_id = '{$_SESSION['login_id']}' ";
} elseif ($_SESSION['login_type'] == 3) {
  $where2 = " where concat('[',REPLACE(p.user_ids,',','],['),']') LIKE '%[{$_SESSION['login_id']}]%' ";
}
?>

<div class="row">
  <div class="col-md-8">
    <div class="card card-outline card-success">
      <div class="card-header">
        <b>Active Projects</b>
      </div>
      <div class="card-body p-0">
        <div class="table-responsive">
          <table class="table m-0 table-hover">
            <colgroup>
              <col width="5%">
              <col width="30%">
              <col width="35%">
              <col width="15%">
              <col width="15%">
            </colgroup>
            <thead>
              <th>No.</th>
              <th>Project Name</th>
              <th>Progress</th>
              <th>Status</th>
              <th></th>
            </thead>
            <tbody>
              <?php
              $i = 1;
              $stat = array("Pending", "Started", "On-Progress", "On-Hold", "Over Due", "Done");
              $where = "";
              if ($_SESSION['login_type'] == 2) {
                $where = " where manager_id = '{$_SESSION['login_id']}' ";
              } elseif ($_SESSION['login_type'] == 3) {
                $where = " where concat('[',REPLACE(user_ids,',','],['),']') LIKE '%[{$_SESSION['login_id']}]%' ";
              }
              $qry = $conn->query("SELECT * FROM project_list $where order by name asc");
              while ($row = $qry->fetch_assoc()) :
                $prog = 0;
                $tprog = $conn->query("SELECT * FROM task_list where project_id = {$row['id']}")->num_rows;
                $cprog = $conn->query("SELECT * FROM task_list where project_id = {$row['id']} and status = 3")->num_rows;
                $prog = $tprog > 0 ? ($cprog / $tprog) * 100 : 0;
                $prog = $prog > 0 ?  number_format($prog, 2) : $prog;
                $prod = $conn->query("SELECT * FROM user_productivity where project_id = {$row['id']}")->num_rows;
                if ($row['status'] == 0 && strtotime(date('Y-m-d')) >= strtotime($row['start_date'])) :
                  if ($prod  > 0  || $cprog > 0)
                    $row['status'] = 2;
                  else
                    $row['status'] = 1;
                elseif ($row['status'] == 0 && strtotime(date('Y-m-d')) > strtotime($row['end_date'])) :
                  $row['status'] = 4;
                endif;
              ?>
                <tr>
                  <td>
                    <?php echo $i++ ?>
                  </td>
                  <td>
                    <a>
                      <?php echo ucwords($row['name']) ?>
                    </a>
                    <br>
                    <small>
                      Due: <?php echo date("Y-m-d", strtotime($row['end_date'])) ?>
                    </small>
                  </td>
                  <td class="project_progress">
                    <div class="progress progress-sm">
                      <div class="progress-bar bg-green" role="progressbar" aria-valuenow="57" aria-valuemin="0" aria-valuemax="100" style="width: <?php echo $prog ?>%">
                      </div>
                    </div>
                    <small>
                      <?php echo $prog ?>% Complete
                    </small>
                  </td>
                  <td class="project-state">
                    <?php
                    if ($stat[$row['status']] == 'Pending') {
                      echo "<span class='badge badge-secondary'>{$stat[$row['status']]}</span>";
                    } elseif ($stat[$row['status']] == 'Started') {
                      echo "<span class='badge badge-primary'>{$stat[$row['status']]}</span>";
                    } elseif ($stat[$row['status']] == 'On-Progress') {
                      echo "<span class='badge badge-info'>{$stat[$row['status']]}</span>";
                    } elseif ($stat[$row['status']] == 'On-Hold') {
                      echo "<span class='badge badge-warning'>{$stat[$row['status']]}</span>";
                    } elseif ($stat[$row['status']] == 'Over Due') {
                      echo "<span class='badge badge-danger'>{$stat[$row['status']]}</span>";
                    } elseif ($stat[$row['status']] == 'Done') {
                      echo "<span class='badge badge-success'>{$stat[$row['status']]}</span>";
                    }
                    ?>
                  </td>
                  <td>
                    <a class="btn btn-primary btn-sm" href="./index.php?page=view_project&id=<?php echo $row['id'] ?>">
                      <i class="fas fa-file-alt">
                      </i>
                      View
                    </a>
                  </td>
                </tr>
              <?php endwhile; ?>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>


  <div class="col-md-4">
    <div class="row">

      <div class="col-12 col-sm-6 col-md-12">
        <div class="small-box bg-light shadow-sm border">
          <div class="inner">
            <h3><?php echo $conn->query("SELECT * FROM project_list $where")->num_rows; ?></h3>
            <p>Total Projects</p>
          </div>
          <div class="icon">
            <i class="fa fa-briefcase" style="color: #FFBF00;"></i>
          </div>
        </div>
      </div>

      <div class="col-12 col-sm-6 col-md-12">
        <div class="small-box bg-light shadow-sm border">
          <div class="inner">
            <h3><?php echo $conn->query("SELECT t.*,p.name as pname,p.start_date,p.status as pstatus, p.end_date,p.id as pid FROM task_list t inner join project_list p on p.id = t.project_id $where2")->num_rows; ?></h3>
            <p>Total Tasks</p>
          </div>
          <div class="icon">
            <i class="fa fa-clipboard-list" style="color: #0000FF;"></i>
          </div>
        </div>
      </div>

      <div class="col-12 col-sm-6 col-md-12">
        <div class="small-box bg-light shadow-sm border">
          <div class="inner">
            <h3>
              <?php
              // Determine the filtering condition based on user role
              if ($_SESSION['login_type'] == 1 || $_SESSION['login_type'] == 2) {
                $where2 = ''; // Admins and project managers see all tasks
              } elseif ($_SESSION['login_type'] == 3) {
                // Regular users see tasks from projects they are associated with
                $where2 = "AND FIND_IN_SET({$_SESSION['login_id']}, p.user_ids) > 0";
              } else {
                $where2 = ''; // Default to no filtering if role is unknown
              }

              // Construct the query to get the number of on-hold tasks (status = 2)
              $query = "
            SELECT 
              COUNT(*) as on_hold_count 
            FROM 
              task_list t 
            INNER JOIN 
              project_list p 
              ON p.id = t.project_id 
            WHERE 
              t.status = 2 
              $where2
          ";

              // Output the query for debugging purposes
              echo "<!-- Debugging SQL: $query -->";

              // Execute the query
              $result = $conn->query($query);

              // Handle the result
              if ($result) {
                $row = $result->fetch_assoc();
                echo $row['on_hold_count'];
              } else {
                echo 0;
              }
              ?>
            </h3>
            <!-- For On-Progress tasks -->
            <p>Urgent Tasks</p>
          </div>
          <div class="icon">
            <i class="fa fa-bell" style="color: #FF0000;"></i>
          </div>
        </div>
      </div>

    </div>
  </div>
</div>