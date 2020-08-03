<?php
class LineCounter {

	private $total_lines;
	private $total_files;
	private $start_path;
	private $level;
	private $mask;

	//start_path - путь к каталогу с которого начинать счетчик
	//level - глубина проникновения счетчика
	//mask - маска файлов попадающих под счет

	public function __construct($start_path, $level, $mask) {
		$this->start_path = $start_path;
		$this->level = $level;
		$this->mask = $mask;
	}
	private function countLines($fpath) {

		$fp = fopen($fpath, "r");
		$i = 0;
		while (!feof($fp)) {
			fgets($fp);
			$i++;
		}
		return $i;
	}
	private function buildFileList() {

		$file = glob($this->start_path.$this->mask);
		$full_p = $this->start_path;

		for ($i = 0; $i < $this->level; $i++) {
			$full_p .= str_repeat('*/', $i);
			$file = array_merge($file, glob($full_p.$this->mask));
		}
		return $file;
	}
	private function getTotalLines($files_array) {

		$total_f = 0;
		foreach ($files_array as $f) {
			$total += countLines($f);
		}
		$this->total_lines = count($files_array);

		$this->total_files = $total_f;
	}
	public function getStat() {

		$this->getTotalLines($this->buildFileList());
		echo "Start path: ".realpath($this->start_path)." \n";
		echo "Total: {$this->total_lines} lines in {$this->total_files} files";

	}
}

//посчитать кол-во файлов и строк в текущем и вложенных каталогах с глубиной проникновения 10 и по маске файла "*.php":
$counter = new LineCounter("./", 10, '*.php');
$counter->getStat();