import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
  Query,
  UseGuards,
  Response,
} from '@nestjs/common';
import { CatalogService } from './catalog.service';

@Controller('catalog')
export class CatalogController {
  constructor(private catalogService: CatalogService) {}

  @Get('minimal-info')
  findMinimalInfo() {
    return this.catalogService.findMinimalInfo()
  }
  @Get()
  findAll() {
    return this.catalogService.findAll()
  }
}
